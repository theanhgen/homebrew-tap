class Flightydeck < Formula
  desc "Unofficial CLI and MCP server for the Flighty macOS app"
  homepage "https://theanhgen.github.io/flightydeck/"
  url "https://github.com/theanhgen/flightydeck/releases/download/v0.2.1/flightydeck-0.2.1-macos-universal.tar.gz"
  sha256 "dfb8b1aa52936ceb55cc5b1029c8f6c4005f0024c18c84ef450ae5df60f5feee"
  license "MIT"

  depends_on :macos

  def install
    bin.install "flightydeck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flightydeck --version")
  end
end
