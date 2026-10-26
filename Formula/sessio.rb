class Sessio < Formula
  desc "Find the coding-agent session you left, and pick it back up"
  homepage "https://theanhgen.github.io/sessio/"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.4.0/sessio-1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "fd5e327458dbccd838671b288df15034a96200fe848f12dfaf6d23b1db726bd1"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.4.0/sessio-1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "524dd5c96d2a9245b9647f08d7c05f7c22e98e1567a7f0625f745158981cfb90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.4.0/sessio-1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e52966ec5ca080b57d5827f041e44fec00f809ecafcfe643208907077852028"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.4.0/sessio-1.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fdfb13844f3630de8ef9cb5262e5ca66de47d5121044c616a9aa702154f17f77"
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
