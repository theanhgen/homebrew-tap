class Sessio < Formula
  desc "Find the coding-agent session you left, and pick it back up"
  homepage "https://theanhgen.github.io/sessio/"
  version "1.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.2/sessio-1.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "33014d0ddba8d1af1729d75b43305536c36e9b8474c4f067bb24dfcaaf252b0a"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.2/sessio-1.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "3010550b0714939bbf2a4fb6eec3d2b7a1c2097abcf9df71ac1c099efe2103c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.2/sessio-1.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ba6cceb5120e908a1e7d8f4cbee4c6e33652a29050aa019e350d6976faa5ced"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.5.2/sessio-1.5.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "589658e7ba5b5123b8033f0d196dd7bfee992f30a03313ce3557a5e4b3eac39f"
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
