cask "wechat-unrevoke" do
  version "1.0.1"
  sha256 "6e212127c9a6e4a9956cf88a68a4be0ab54e33353467fe3d89030a02edcba60b"

  url "https://github.com/zengtianli/WeChatUnrevoke/releases/download/v#{version}/Unrevoke-#{version}.zip",
      verified: "github.com/zengtianli/WeChatUnrevoke/"
  name "Unrevoke"
  name "WeChatUnrevoke"
  desc "Keep recalled WeChat messages, and stop WeChat's updater from undoing it"
  homepage "https://github.com/zengtianli/WeChatUnrevoke"

  depends_on macos: :sequoia

  app "Unrevoke.app"

  # adhoc 签名，Gatekeeper 默认不放行。Homebrew 6 已经拿掉了 --no-quarantine
  # （实测 `brew install --cask --no-quarantine` 报 invalid option），
  # 所以只能装完手动摘隔离属性 —— caveats 里写的就是这条。
  caveats <<~EOS
    没有 Apple 开发者签名和公证，macOS 默认不让打开。装完跑一次：

      xattr -dr com.apple.quarantine /Applications/Unrevoke.app

    Unrevoke 改的是 /Applications/WeChat.app，打补丁那一步会要管理员密码。
    命令行版：brew install zengtianli/tap/wechattweak

    No Apple Developer ID signature or notarisation, so Gatekeeper blocks it by
    default. Run the xattr line above once after installing.
  EOS

  zap trash: [
    "~/Library/Caches/io.github.zengtianli.unrevoke",
    "~/Library/Preferences/io.github.zengtianli.unrevoke.plist",
  ]
end
