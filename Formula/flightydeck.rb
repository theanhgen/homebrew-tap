class Flightydeck < Formula
  desc "Unofficial CLI and MCP server for the Flighty macOS app"
  homepage "https://theanhgen.github.io/flightydeck/"
  url "https://github.com/theanhgen/flightydeck/releases/download/v0.2.2/flightydeck-0.2.2-macos-universal.tar.gz"
  sha256 "b7f9ec3c6c01efd7113178524195d8dbe3f1cddbb2094c18c0fb7a5addbf741a"
  license "MIT"

  depends_on :macos

  def install
    bin.install "flightydeck"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flightydeck --version")
  end
end
