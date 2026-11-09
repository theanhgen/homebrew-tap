class Sessio < Formula
  desc "Find the coding-agent session you left, and pick it back up"
  homepage "https://theanhgen.github.io/sessio/"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.6.0/sessio-1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "66a208792e1808cad11ba3a34502e9df00971138ac5e744654fce132f6338b16"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.6.0/sessio-1.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "600155e6b710305634317680915fca1208385a16cb5745a2b188811a8fa4348b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.6.0/sessio-1.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7273431644fb3b6790b8268cb19c1732dea7454d795fa806bb5ecbc8d4e3ee1"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.6.0/sessio-1.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "66af2eb7cb9517f0f10790a231374c09e99217dbdb1db3cf5afa00c5a820e5a3"
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
