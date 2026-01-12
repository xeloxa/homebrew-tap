class S3finder < Formula
  desc "AI-Powered S3 Bucket Enumeration Tool"
  homepage "https://github.com/xeloxa/s3finder"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.3/s3finder-v1.0.3-darwin-arm64.tar.gz"
      sha256 "ecb3f31c4716c46ce9d4fd5387857c80b71f345b33bfe5ba4a8646bee55cfc38"
    else
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.3/s3finder-v1.0.3-darwin-amd64.tar.gz"
      sha256 "10d76643291f2c4f30c7d7b73e41e3ea4e10185731379ca6f23b684cd3ef443d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.3/s3finder-v1.0.3-linux-arm64.tar.gz"
      sha256 "82736bbf58bde30988e12805451ed574f74048e5d13b1ab1cee9e943b4890e52"
    else
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.3/s3finder-v1.0.3-linux-amd64.tar.gz"
      sha256 "0c0c0d3ba0d42059333e09f36b1e9755d886774ed6a3fc478cd78e494b06d643"
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
