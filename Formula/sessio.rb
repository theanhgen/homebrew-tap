class Sessio < Formula
  desc "Find the coding-agent session you left, and pick it back up"
  homepage "https://theanhgen.github.io/sessio/"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.7.0/sessio-1.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "66d5d7f766e88cfc03671cc19065643e80ad2771170f4891a80e51ae4da4ace0"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.7.0/sessio-1.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "48115c042ea902358143a613b66165b2a96f3112b894d15978040577e1087d0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/theanhgen/sessio/releases/download/v1.7.0/sessio-1.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83acfb0950d947e3212ad42325463d0989c641eedbf6afcf578489d1232dd183"
    end
    on_intel do
      url "https://github.com/theanhgen/sessio/releases/download/v1.7.0/sessio-1.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1d9c0d5ff7292f4f9bf118d2246ed15208c07dbc9e085dc3906a57df05c4854f"
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
