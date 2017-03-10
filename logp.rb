class Logp < Formula
  desc "Command-line client for Log Periodic logging service"
  homepage "https://logperiodic.com"
  url "https://github.com/hoytech/logp/archive/logp-0.1.2.tar.gz"
  sha256 "e72b9b23437ea463921bb5088b4a01f33bd3667d1eb4630be749c3a9168058c5"

  depends_on "openssl"

  def install
    system "make", "XCXXFLAGS=-I/usr/local/opt/openssl/include", "XLDFLAGS=-L/usr/local/opt/openssl/lib", "-j4"
    bin.install "logp"
  end

  test do
    system "#{bin}/logp", "--version"
  end
end
