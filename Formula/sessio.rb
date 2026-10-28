class Sessio < Formula
  desc "Find the coding-agent session you left, and pick it back up"
  homepage "https://theanhgen.github.io/sessio/"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.1/sessio-1.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "280b42a9f019e0bc7ed26be93c971c65d7fcd16800fd41024ffb3786f633bf77"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.1/sessio-1.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "8266dafaf6d0acef98b931643fa93e3525976bf25b58146666b7d57333697ebf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.1/sessio-1.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ebb5d280293ed6421089abe58531d4d0408b56a032381053eede2695439a8e41"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.1/sessio-1.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a1d766ce814e6ff3e79c2522826da4e5b01a714eb106918bd4a6e2107bb26ad5"
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
