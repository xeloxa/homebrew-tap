class S3finder < Formula
  desc "AI-Powered S3 Bucket Enumeration Tool"
  homepage "https://github.com/xeloxa/s3finder"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.2/s3finder-v1.0.2-darwin-arm64.tar.gz"
      sha256 "416c5e8abc2ca1ff072af32e76b43d2d4e5fb4e11b13a887f9ed5b03241651c8"
    else
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.2/s3finder-v1.0.2-darwin-amd64.tar.gz"
      sha256 "3a6a8ac53f8938c482d46ee922d1459f7e12e2c4df829edb8290c5559fe0a351"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.2/s3finder-v1.0.2-linux-arm64.tar.gz"
      sha256 "ef374c28223547981c40708cd4d5655cd55234eed40dd9c1d73e83fbfcdfe7a0"
    else
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.2/s3finder-v1.0.2-linux-amd64.tar.gz"
      sha256 "d2f42fc6ef14711749ed0424404fa10121e72d8f11b30f6af7a06d7130fd6a8a"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "s3finder-darwin-arm64" => "s3finder"
      else
        bin.install "s3finder-darwin-amd64" => "s3finder"
      end
    else
      if Hardware::CPU.arm?
        bin.install "s3finder-linux-arm64" => "s3finder"
      else
        bin.install "s3finder-linux-amd64" => "s3finder"
      end
    end
  end

  test do
    assert_match "s3finder", shell_output("#{bin}/s3finder --help")
  end
end
