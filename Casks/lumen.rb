cask "lumen" do
  version "1.1.0,23"
  sha256 "c1c6de9757e81d61dc0095a9402ecfe3c9f93135b12cd9c2e6ee6d9f95347524"

  url "https://github.com/zengtianli/homebrew-tap/releases/download/lumen-v1.1.0/Lumen-1.1.0-23.dmg"
  name "Lumen"
  desc "Lumen · 知页"
  homepage "https://app-mac-lumen.tianli.cyou/"

  depends_on macos: :sonoma

  app "Lumen.app"
  binary "#{appdir}/Lumen.app/Contents/Resources/lumen", target: "lumen"
end
