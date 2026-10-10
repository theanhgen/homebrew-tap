class Flightydeck < Formula
  desc "Unofficial CLI and MCP server for the Flighty macOS app"
  homepage "https://theanhgen.github.io/flightydeck/"
  url "https://github.com/theanhgen/flightydeck/releases/download/v0.4.0/flightydeck-0.4.0-macos-universal.tar.gz"
  sha256 "93ffe2acc6a4938e4061d14c4da3bb65b27567ccb5e45742cd7bfe16757e5222"
  license "MIT"

  depends_on :macos

  def install
    bin.install "flightydeck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flightydeck --version")
  end
end
