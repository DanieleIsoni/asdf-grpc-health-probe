#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/grpc-ecosystem/grpc-health-probe"
TOOL_NAME="grpc-health-probe"
TOOL_TEST="grpc-health-probe --help"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

list_all_versions() {
  list_github_tags
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//'
}

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  local platform
  [ "Linux" = "$(uname)" ] && platform="linux" || platform="darwin"

  local arch
  [ "x86_64" = "$(uname -m)" ] && arch="amd64" || arch="386"
  [ "aarcah64" = "$(uname -m)" ] || [ "arm64" = "$(uname -m)" ] && arch="arm64"

  url="$GH_REPO/releases/download/v${version}/grpc_health_probe-${platform}-${arch}"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3/bin"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"
    cp -r "$ASDF_DOWNLOAD_PATH"/$TOOL_NAME-$version "$install_path"/$TOOL_NAME

    chmod +x "$install_path"/$TOOL_NAME
    test -x "$install_path/$TOOL_NAME" || fail "Expected $install_path/$TOOL_NAME to be executable."

    echo "$TOOL_NAME $version installation was successful in $install_path!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
