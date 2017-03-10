class Logp < Formula
  desc "Command-line client for Log Periodic logging service"
  homepage "https://logperiodic.com"
  head "https://github.com/hoytech/logp.git", :tag => "logp-0.1.2"

  depends_on "openssl"

  def install
    ## FIXME: This touch is a hack: the makefile looks for this file to see if the version has changed
    system "touch", ".git/refs/heads/master"
    system "git", "submodule", "update", "--init"
    system "make", "XCXXFLAGS=-I/usr/local/opt/openssl/include", "XLDFLAGS=-L/usr/local/opt/openssl/lib", "-j4"
    bin.install "logp"
  end

  test do
    system "#{bin}/logp", "--version"
  end
end
