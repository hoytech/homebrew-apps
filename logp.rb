class Logp < Formula
  desc "Command-line client for Log Periodic logging service"
  homepage "https://logperiodic.com"
  head "https://github.com/hoytech/logp.git", :tag => "logp-0.1.3"

  depends_on "openssl"

  def install
    system "git", "submodule", "update", "--init"
    system "make", "XCXXFLAGS=-I/usr/local/opt/openssl/include", "XLDFLAGS=-L/usr/local/opt/openssl/lib", "-j4"
    bin.install "logp"
  end

  test do
    system "#{bin}/logp", "--version"
  end
end
