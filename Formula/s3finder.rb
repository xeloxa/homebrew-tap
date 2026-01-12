class S3finder < Formula
  desc "AI-Powered S3 Bucket Enumeration Tool"
  homepage "https://github.com/xeloxa/s3finder"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.1/s3finder-v1.0.1-darwin-arm64.tar.gz"
      sha256 "de5374f171ccd2b09dd05ec3a9bb007e03165f14ae79f80532d58964c03744ee"
    else
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.1/s3finder-v1.0.1-darwin-amd64.tar.gz"
      sha256 "6b0a23ac8480906b6d0603ce80553ed3cbc961504bad1c73ac9df78d30f7b6b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.1/s3finder-v1.0.1-linux-arm64.tar.gz"
      sha256 "ea44e890b84970571222375c35f53d04d6bbda98fdb45a9048edadc514be1bbf"
    else
      url "https://github.com/xeloxa/s3finder/releases/download/v1.0.1/s3finder-v1.0.1-linux-amd64.tar.gz"
      sha256 "1fed13caacabf877cb2f3bb9f3874342c72f64a8b00c7bac0359112f3b723906"
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
