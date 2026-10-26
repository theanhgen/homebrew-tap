class Sessio < Formula
  desc "Find the coding-agent session you left, and pick it back up"
  homepage "https://theanhgen.github.io/sessio/"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.0/sessio-1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "7d44deab29e2c4e256aa384854f26225e024e5767e61ca3bb14b96b6dccd387b"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.0/sessio-1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "146ac4056975c50c1f624f47639781960460d264d0e69d385cff050e964ee1f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.0/sessio-1.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e0906c0944ec35a34f936e9afb6a2a0a5e5a0e9591c78383a5bbe7bcb53b032"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.0/sessio-1.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f0439f587694d1ba1c9bfe7d353d56029547bea80d8efb66754f326591e26cf5"
    end
  end

  def install
    bin.install "sessio"
    # The command the README and --help use; npm installs it under both names too.
    bin.install_symlink "sessio" => "sessions"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sessio --version")
  end
end
