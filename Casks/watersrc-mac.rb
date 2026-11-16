cask "watersrc-mac" do
  version "1.0.1,824"
  sha256 "c97528c1b6f0602a78a3a4705d698e81cd65a4cb9ffb9037e3a824bd08050fcf"

  url "https://github.com/zengtianli/homebrew-tap/releases/download/watersrc-mac-v1.0.1/watersrc-mac-v1.0.1.dmg"
  name "浙水清源"
  desc "HydroClear · 浙水清源"
  homepage "https://github.com/zengtianli/homebrew-tap"

  depends_on macos: :sonoma

  app "浙水清源.app"
  binary "#{appdir}/浙水清源.app/Contents/Resources/bin/watersrc", target: "watersrc"
end
