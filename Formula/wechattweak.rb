class Wechattweak < Formula
  desc "Patch macOS WeChat to keep recalled messages (WeChat 4.x supported)"
  homepage "https://github.com/zengtianli/WeChatTweak"
  url "https://github.com/zengtianli/WeChatTweak/archive/refs/tags/2.1.0.tar.gz"
  sha256 "2cf02b50200857f37b564a0fb1059032024df4f70f833f2680ff56d153eb25d2"
  license "AGPL-3.0-only"
  head "https://github.com/zengtianli/WeChatTweak.git", branch: "master"

  depends_on xcode: ["16.0", :build]
  depends_on :macos
  depends_on macos: :monterey

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/wechattweak"
  end

  # 刻意**不**把 config.json 装进 prefix。
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
        brew install --cask --no-quarantine zengtianli/tap/unrevoke
    EOS
  end

  test do
    assert_match "wechattweak", shell_output("#{bin}/wechattweak --help")
  end
end
