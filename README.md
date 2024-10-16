<div align="center">

# asdf-grpc-health-probe [![Build](https://github.com/DanieleIsoni/asdf-grpc-health-probe/actions/workflows/build.yml/badge.svg)](https://github.com/DanieleIsoni/asdf-grpc-health-probe/actions/workflows/build.yml) [![Lint](https://github.com/DanieleIsoni/asdf-grpc-health-probe/actions/workflows/lint.yml/badge.svg)](https://github.com/DanieleIsoni/asdf-grpc-health-probe/actions/workflows/lint.yml)


[grpc-health-probe](https://github.com/grpc-ecosystem/grpc-health-probe) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add grpc-health-probe https://github.com/DanieleIsoni/asdf-grpc-health-probe.git
```

grpc-health-probe:

```shell
# Show all installable versions
asdf list-all grpc-health-probe

# Install specific version
asdf install grpc-health-probe latest

# Set a version globally (on your ~/.tool-versions file)
asdf global grpc-health-probe latest

# Now grpc-health-probe commands are available
grpc-health-probe --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to the developer of the original plugin from which I forked](https://github.com/zufardhiyaulhaq/)!

[Thanks goes to these contributors](https://github.com/DanieleIsoni/asdf-grpc-health-probe/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Zufar Dhiyaulhaq](https://github.com/zufardhiyaulhaq/)
