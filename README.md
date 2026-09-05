# homebrew-tap

macOS 微信两件套的 Homebrew tap。

**中文** | [English](#english)

上游 [`sunnyyoung/WeChatTweak`](https://github.com/sunnyyoung/WeChatTweak)（13.8k★）
停在 2026-02-08，只覆盖到微信 3.8.x。微信 4.x 把撤回逻辑搬进了 `wechat.dylib`，
老补丁点全部失效。这两个包是 4.x 的续。

```bash
# 图形界面 —— 一个按钮，微信更新后自己把补丁打回去
brew install --cask zengtianli/tap/wechat-unrevoke
xattr -dr com.apple.quarantine /Applications/Unrevoke.app

# 命令行 —— 图形界面驱动的就是它
brew install zengtianli/tap/wechattweak
```

装过别家同名包要先卸（二进制名一样，会冲突）：

```bash
brew uninstall sunnyyoung/tap/wechattweak || brew uninstall wechattweak
```

那行 `xattr` 是因为 app 只做了 adhoc 签名、没有用 Apple 开发者 ID 公证，而 Homebrew 6
已经拿掉了 `--no-quarantine`，装 cask 一定会被隔离。也可以自己编译，一共一千行左右 Swift。

补丁库（`config.json`）在运行时从 fork 的 `master` 拉，所以微信出新版本被收录后，
两个包都不用升级。

---

## English

Homebrew tap for two macOS WeChat tools.

Upstream [`sunnyyoung/WeChatTweak`](https://github.com/sunnyyoung/WeChatTweak) (13.8k★)
stopped at 2026-02-08 and only ever covered WeChat 3.8.x. WeChat 4.x moved the
message-revoke logic into `wechat.dylib`, which retired every old patch point.
These two packages are the 4.x continuation.

## Install

```bash
# GUI — one button, re-applies the patch after WeChat updates itself
brew install --cask zengtianli/tap/wechat-unrevoke
xattr -dr com.apple.quarantine /Applications/Unrevoke.app

# CLI — the engine the GUI drives
brew install zengtianli/tap/wechattweak
```

Already have a `wechattweak` from another tap? Uninstall it first — same binary name:

```bash
brew uninstall sunnyyoung/tap/wechattweak || brew uninstall wechattweak
```

## What's in here

| Package | Kind | Source | License |
|---|---|---|---|
| [`wechat-unrevoke`](Casks/wechat-unrevoke.rb) | Cask (app) | [zengtianli/WeChatUnrevoke](https://github.com/zengtianli/WeChatUnrevoke) | AGPL-3.0 |
| [`wechattweak`](Formula/wechattweak.rb) | Formula (prebuilt universal binary) | [zengtianli/WeChatTweak](https://github.com/zengtianli/WeChatTweak) | AGPL-3.0 |

The `xattr` line is needed because the app is ad-hoc signed, not notarised with an Apple
Developer ID — and Homebrew 6 removed `--no-quarantine`, so a cask install always
quarantines. You can also build it yourself — it is about a thousand lines of Swift.

The patch library (`config.json`) is fetched at runtime from the fork's `master`, so a
newly-supported WeChat build works without upgrading either package.
