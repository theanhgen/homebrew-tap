class Sessio < Formula
  desc "Find the coding-agent session you left, and pick it back up"
  homepage "https://theanhgen.github.io/sessio/"
  version "1.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.3/sessio-1.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "ebc1dae75a561c66b9f91d5a0b551d6699136e861916b73fbe2fb6e560f35445"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.3/sessio-1.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "b3ab3fd3442e08ada58848602f943028b7990740e0c257ee6503066d5f1e5e1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.3/sessio-1.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2982f099872a686d9e7e2c02eee94f74ed70614717847bf1eee4a97eb6248f5"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.3/sessio-1.5.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fd1639485bf14873fb52ddda7440302001b155dca1ed03566036d7830cd2ce8e"
    end
  end

  def install
    bin.install "sessio"
    # The command the README and --help use; npm installs it under both names too.
    bin.install_symlink "sessio" => "sessions"
    pkgshare.install "skills"
  end

  def caveats
    <<~EOS
      The agent skill is in #{opt_pkgshare}/skills/sessio. Link it into Claude Code:
        ln -s #{opt_pkgshare}/skills/sessio ~/.claude/skills/sessio
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sessio --version")
  end
end
