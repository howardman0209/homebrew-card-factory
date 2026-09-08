# Card Factory Homebrew tap

Homebrew tap for the Card Factory EMV test-card CLI. This repository holds
package metadata only; the binaries live in the project's public release
repository.

**Staging distribution.** This tap tracks staged Card Factory CLI releases for
the project's own testers. Treat installations from it as disposable and
reinstall rather than upgrade if the project's release repository moves to a
different account. The cask is published together with each staged CLI release.

## Install

```sh
brew tap howardman0209/card-factory
brew install --cask card-factory
card-factory --version
card-factory doctor --scheme mastercard
```

## Supported target

| Platform | Architecture | Minimum OS |
| --- | --- | --- |
| macOS | ARM64 | macOS 11 Big Sur |

Intel macOS is not published. The cask refuses to install there rather than
supplying a runtime built for another architecture; there is no Rosetta
fallback.

## Upgrade and removal

```sh
brew update
brew upgrade --cask card-factory
brew uninstall --cask card-factory
```

Uninstalling removes only the package-manager copy. The downloaded CAP cache
and the current selection under `~/Library/Application Support/CardFactory`
survive upgrade, uninstall, and reinstall.

## Prerequisites

The cask carries a complete self-contained tree, including a Java runtime,
GlobalPlatformPro, and verified CAPs, so no separate Java, Gradle, Java Card
SDK, or `gp` installation is needed. A PC/SC reader and its operating-system
driver remain separate prerequisites, installed from their own vendor
instructions.
