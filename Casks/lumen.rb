cask "lumen" do
  version "1.1.0,22"
  sha256 "6c40b2291bb5127df01ba88c5aad384ef1b5820e0d83ad6fd58fb6807ae4ad20"

  url "https://github.com/zengtianli/homebrew-tap/releases/download/lumen-v1.1.0/Lumen-1.1.0-22.dmg"
  name "Lumen"
  desc "Lumen · 知页"
  homepage "https://app-mac-lumen.tianli.cyou/"

  depends_on macos: :sonoma

  app "Lumen.app"
  binary "#{appdir}/Lumen.app/Contents/Resources/lumen", target: "lumen"
end
