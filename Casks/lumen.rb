cask "lumen" do
  version "1.1.0,21"
  sha256 "0afdeef3e7b29c4d1f60bf30db02c53b6d6768dc769ba417b8635042d5e8368f"

  url "https://github.com/zengtianli/homebrew-tap/releases/download/lumen-v1.1.0/Lumen-1.1.0-21.dmg"
  name "Lumen"
  desc "Lumen · 知页"
  homepage "https://app-mac-lumen.tianli.cyou/"

  depends_on macos: :sonoma

  app "Lumen.app"
  binary "#{appdir}/Lumen.app/Contents/Resources/lumen", target: "lumen"
end
