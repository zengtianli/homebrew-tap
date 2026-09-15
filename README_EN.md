# homebrew-tap

[中文](README.md) | **English**

Homebrew tap for a pair of macOS WeChat tools.



Upstream [`sunnyyoung/WeChatTweak`](https://github.com/sunnyyoung/WeChatTweak) (13.8k★)
stopped at 2026-02-08 and covers only WeChat 3.8.x. WeChat 4.x moved message-revoke logic into `wechat.dylib`,
invalidating every old patch point. These two packages continue support for 4.x.

```bash
# 图形界面 —— 一个按钮，微信更新后自己把补丁打回去
brew install --cask zengtianli/tap/wechat-unrevoke
xattr -dr com.apple.quarantine /Applications/Unrevoke.app

# 命令行 —— 图形界面驱动的就是它
brew install zengtianli/tap/wechattweak
```

Uninstall a same-named package from another tap first, because the binary names conflict:

```bash
brew uninstall sunnyyoung/tap/wechattweak || brew uninstall wechattweak
```

The `xattr` line is needed because the app is ad-hoc signed and not notarized with an Apple Developer ID. Homebrew 6
removed `--no-quarantine`, so cask installations are always quarantined. You can also compile it yourself: roughly a thousand lines of Swift.

The patch library (`config.json`) is fetched from the fork’s `master` at runtime. Once support for a new WeChat version is added,
neither package needs an upgrade.

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
