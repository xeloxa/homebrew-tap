class S3finder < Formula
  desc "AI-Powered S3 Bucket Enumeration Tool"
  homepage "https://github.com/xeloxa/s3finder"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.2/s3finder-v1.0.2-darwin-arm64.tar.gz"
      sha256 "76915f3d08674de7819a43ef04fe9819d7b3b4f55c08b7e8e63874a1b0039b02"
    else
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.2/s3finder-v1.0.2-darwin-amd64.tar.gz"
      sha256 "2ecc3686345fbd6e77061cb614097e833e5849a5b32f7c0590896220e542f61c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.2/s3finder-v1.0.2-linux-arm64.tar.gz"
      sha256 "931b16a6ed60ce3f530c694889a314078317cbc5ffa6063a798933743dcf68bb"
    else
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.2/s3finder-v1.0.2-linux-amd64.tar.gz"
      sha256 "2974beada4c8c2e0c833c5a7713422cd232e2acfc6f332c45d704e46887ec593"
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
