class Logp < Formula
  desc "Command-line client for Log Periodic logging service"
  homepage "https://logperiodic.com"
  head "https://github.com/hoytech/logp.git", :tag => "logp-0.1.2"

  depends_on "openssl"

  def install
    bin.install "logp"
  end

  test do
    system "#{bin}/logp", "--version"
  end
end
