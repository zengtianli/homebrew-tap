class MirrorDisplays < Formula
  desc "Command-line tool for fiddling with display mirroring: on/off/toggle"
  homepage "https://github.com/fcanas/mirror-displays"
  url "https://github.com/fcanas/mirror-displays/archive/refs/tags/v1.2.tar.gz"
  sha256 "08ce49df841d322829771e9c8e00a895f3657b2884dfb56183804aafb866cdbb"
  license "GPL-3.0-only"

  depends_on :macos

  def install
    # Upstream only ships an x86_64 binary; build natively from source.
    system ENV.cc, "-fobjc-arc", "-O2", "mirror.m", "-o", "mirror",
           "-framework", "Foundation", "-framework", "ApplicationServices"
    bin.install "mirror"
    man1.install "mirror.1"
  end

  test do
    assert_match "usage: mirror", shell_output("#{bin}/mirror -h 2>&1")
  end
end
