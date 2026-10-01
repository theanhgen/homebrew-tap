class Flightydeck < Formula
  desc "Unofficial CLI and MCP server for the Flighty macOS app"
  homepage "https://theanhgen.github.io/flightydeck/"
  url "https://github.com/theanhgen/flightydeck/releases/download/v0.3.0/flightydeck-0.3.0-macos-universal.tar.gz"
  sha256 "a9dea12e97871b87fc2e5d16687b6d4fc78ee6489af8b8569559c8ef0467a74c"
  license "MIT"

  depends_on :macos

  def install
    bin.install "flightydeck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flightydeck --version")
  end
end
