cask "card-factory" do
  version "0.2.1"
  # Recomputed from the anonymously downloaded cli-0.2.1 asset and matched
  # against its published .zip.sha256 sidecar.
  sha256 "5523524aa06d12755e04470222c39d6ac3c41f7f20d6b7c80e83e9060d5da08e"

  url "https://github.com/howardman0209/EmvTestCardFactory-CLI/releases/download/cli-#{version}/card-factory-#{version}-macos-aarch64.zip"
  name "Card Factory CLI"
  desc "Installs and personalizes EMV test card applets from a terminal"
  homepage "https://github.com/howardman0209/EmvTestCardFactory-CLI"

  # Only macOS ARM64 is built and validated for this version. An Intel host must
  # fail here rather than receive a runtime built for another architecture.
  depends_on arch: :arm64
  # The bundled Java 25 runtime and its libraries declare minos 11.0.
  depends_on macos: :big_sur

  # Link only the wrapper. It resolves this link back to the staged tree, which
  # also holds the bundled runtime, GlobalPlatformPro and the bundled CAPs.
  binary "card-factory-#{version}-macos-aarch64/bin/card-factory"
end
