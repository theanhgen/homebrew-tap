class Flightydeck < Formula
  desc "Unofficial CLI and MCP server for the Flighty macOS app"
  homepage "https://theanhgen.github.io/flightydeck/"
  url "https://github.com/theanhgen/flightydeck/releases/download/v0.3.1/flightydeck-0.3.1-macos-universal.tar.gz"
  sha256 "cb3b3185691a16e07e82198b2892eca180f5ef5f1ba84a23c2ee0804eeed5872"
  license "MIT"

  depends_on :macos

  def install
    bin.install "flightydeck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flightydeck --version")
  end
end
