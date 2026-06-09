class Viser < Formula
  desc "Content-adaptive video encoding optimizer"
  homepage "https://github.com/vbasky/viser"
  url "https://github.com/vbasky/viser/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "317bc9bbc9370c6cd520e6dfb7d82236aafbfde71a425f3aaa83c239a9fe2f8a"
  license "BSD-2-Clause"

  depends_on "rust" => :build
  depends_on "ffmpeg"

  def install
    system "cargo", "install",
      *std_cargo_args(path: "crates/viser-cli")
  end

  test do
    assert_match "viser",
      shell_output("#{bin}/viser --help")
  end
end
