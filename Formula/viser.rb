class Viser < Formula
  desc "Content-adaptive video encoding optimizer"
  homepage "https://github.com/vbasky/viser"
  url "https://github.com/vbasky/viser/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "c5ce8d49a188ae30255e4c17208ad16149f39bf9ac185159fdfa77cf92514ba6"
  license "BSD-2-Clause"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "ffmpeg"
  depends_on "fontconfig"

  def install
    system "cargo", "install",
      *std_cargo_args(path: "crates/viser-cli")
  end

  test do
    assert_match version.to_s,
      shell_output("#{bin}/viser --version")
  end
end
