class Flightydeck < Formula
  desc "Unofficial CLI and MCP server for the Flighty macOS app"
  homepage "https://theanhgen.github.io/flightydeck/"
  url "https://github.com/theanhgen/flightydeck/releases/download/v0.2.0/flightydeck-0.2.0-macos-universal.tar.gz"
  sha256 "b47b4574fe063965b1c48f4c4d3b2dca39b138c420797b5a4b3d34407d09a549"
  license "MIT"

  depends_on :macos

  def install
    bin.install "flightydeck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flightydeck --version")
  end
end
