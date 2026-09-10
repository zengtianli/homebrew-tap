cask "wechat-unrevoke" do
  version "1.0.3"
  sha256 "ffa9a0aba790fc9f13eee5f6d899225b1353e9484dd9246b0dacfa9d6a5bfac6"

  url "https://github.com/zengtianli/WeChatUnrevoke/releases/download/v#{version}/WeChatUnrevoke-#{version}.zip",
      verified: "github.com/zengtianli/WeChatUnrevoke/"
  name "WeChatUnrevoke"
  desc "Native app to manage WeChat anti-recall patches"
  homepage "https://github.com/zengtianli/WeChatUnrevoke"

  depends_on macos: :sequoia

  app "WeChatUnrevoke.app"

  zap trash: [
    "~/Library/Caches/io.github.zengtianli.unrevoke",
    "~/Library/Preferences/io.github.zengtianli.unrevoke.plist",
  ]

  # adhoc 签名，Gatekeeper 默认不放行。Homebrew 6 已经拿掉了 --no-quarantine
  # （实测 `brew install --cask --no-quarantine` 报 invalid option），
  # 所以只能装完手动摘隔离属性 —— caveats 里写的就是这条。
  caveats <<~EOS
    没有 Apple 开发者签名和公证，macOS 默认不让打开。装完跑一次：

      xattr -dr com.apple.quarantine /Applications/WeChatUnrevoke.app

    WeChatUnrevoke 修改的是 /Applications/WeChat.app，需要时会请求管理员密码。
    命令行版：brew install zengtianli/tap/wechattweak

    No Apple Developer ID signature or notarisation, so Gatekeeper blocks it by
    default. Run the xattr line above once after installing.
  EOS
end
