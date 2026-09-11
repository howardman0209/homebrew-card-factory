cask "card-factory" do
  version "0.2.2"
  # Recomputed from the anonymously downloaded cli-0.2.2 asset and matched
  # against its published .zip.sha256 sidecar.
  sha256 "deac2a0f6d69f52cdd35f3cfaf54c5d358ce11cc9219637b567f01531e42211a"

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
