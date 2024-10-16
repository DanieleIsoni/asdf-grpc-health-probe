# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test grpc-health-probe https://github.com/DanieleIsoni/asdf-grpc-health-probe.git "version"
```

Tests are automatically run in GitHub Actions on push and PR.
