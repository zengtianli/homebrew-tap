class Wechattweak < Formula
  desc "Patch macOS WeChat to keep recalled messages (WeChat 4.x supported)"
  homepage "https://github.com/zengtianli/WeChatTweak"
  url "https://github.com/zengtianli/WeChatTweak/releases/download/2.3.0/wechattweak-2.3.0-macos-universal.tar.gz"
  sha256 "9a88b1d2486c3957b270f6f10ecfa6300448f0b4bee361b1acc538d9f8b72b94"
  license "AGPL-3.0-only"

  # 装预编译的 universal 二进制，不从源码编。
  # 源码编要 Xcode（swift-tools-version 6.0），为了一个 CLI 让人先装 15G 的 Xcode
  # 不合理；而且 Homebrew 在 CLT 版本落后于 Xcode 时会直接拒绝源码编译
  # （本机 2026-09-04 实测："Your Command Line Tools are too outdated"）。
  # 自己编：git clone 后 swift build -c release --arch arm64 --arch x86_64
  depends_on macos: :monterey

  def install
    bin.install "wechattweak"
  end

  # 刻意**不**装 config.json。
  # 引擎解析 config 的顺序是「当前目录 → 可执行文件往上找 8 层 → fork 的 master
  # config.json」。装了本地副本就会命中第二步，于是补丁库被冻结在发布那一刻，
  # 微信出新 build 必须等 formula 升级。不装 → 落到远端，新 build 一收录就能用。
  def caveats
    <<~EOS
      打补丁要改 /Applications/WeChat.app，需要管理员密码：

        sudo wechattweak patch          # 打防撤回 + 顺手挡住微信自动更新
        wechattweak doctor              # 体检：当前是什么状态
        sudo wechattweak restore        # 还原成原样

      补丁库（config.json）运行时从本仓 master 拉，所以微信出新版本被收录后
      不用升级这个 formula。

      不想开终端 → 图形界面：
        brew install --cask zengtianli/tap/wechat-unrevoke
        xattr -dr com.apple.quarantine /Applications/Unrevoke.app
    EOS
  end

  test do
    assert_match "wechattweak", shell_output("#{bin}/wechattweak --help")
  end
end
