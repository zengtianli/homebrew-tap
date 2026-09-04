cask "unrevoke" do
  version "1.0.1"
  sha256 "6e212127c9a6e4a9956cf88a68a4be0ab54e33353467fe3d89030a02edcba60b"

  url "https://github.com/zengtianli/Unrevoke/releases/download/v#{version}/Unrevoke-#{version}.zip",
      verified: "github.com/zengtianli/Unrevoke/"
  name "Unrevoke"
  desc "Keep recalled WeChat messages, and stop WeChat's updater from undoing it"
  homepage "https://github.com/zengtianli/Unrevoke"

  depends_on macos: ">= :sequoia"

  app "Unrevoke.app"

  # 这个 app 是 adhoc 签名的（见 caveats），Gatekeeper 默认不放行。
  # 装的时候带 --no-quarantine 才不用再手动 xattr。
  caveats do
    <<~EOS
      没有 Apple 开发者签名和公证，macOS 默认不让打开。装完二选一：

        brew install --cask --no-quarantine zengtianli/tap/unrevoke
        # 或者装完之后：
        xattr -dr com.apple.quarantine /Applications/Unrevoke.app

      Unrevoke 改的是 /Applications/WeChat.app，打补丁那一步会要管理员密码。
      命令行版：brew install zengtianli/tap/wechattweak
    EOS
  end

  zap trash: [
    "~/Library/Preferences/io.github.zengtianli.unrevoke.plist",
    "~/Library/Caches/io.github.zengtianli.unrevoke",
  ]
end
