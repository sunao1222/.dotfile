# Dotfiles

NixOS と Home Manager で、デスクトップから開発ツールまでを管理する個人用設定です。Nix Flakes を入口に、マシン固有の設定とユーザー環境を分けています。

> 特定のハードウェアとユーザーを前提とした設定です。別の環境で使う場合は、適用前にホスト設定やサービスの公開範囲を確認してください。

## 主な構成

- **デスクトップ** — Niri、Dank Material Shell、Walker、COSMIC、PipeWire
- **シェル・端末** — Zsh、Powerlevel10k、direnv / nix-direnv、WezTerm、Ghostty
- **エディター** — Nixvim で設定した Neovim。LSP、Treesitter、Telescope などを使用
- **日常・開発** — Fcitx5 + SKK、Firefox、Yazi、Git、Taskwarrior、kubectl、Terraform
- **AI ツール** — oh-my-pi、Pi、OpenCode、OpenChamber、llama.cpp、Open WebUI
- **システム** — Docker、Podman、Waydroid、Flatpak、Tailscale など

## 管理対象

| Flake 出力 | 用途 | 主な構成 |
| --- | --- | --- |
| `nixosConfigurations.thinkbook` | NixOS | Intel CPU / GPU、ノート PC 向け電源管理 |
| `nixosConfigurations.miyo-chan` | NixOS | Intel CPU、NVIDIA GPU |
| `homeConfigurations.myHome` | Home Manager | `sunao1222` のユーザー環境 |

いずれも `x86_64-linux` 向けです。NixOS の共通設定にホスト別のハードウェア設定を重ねています。Home Manager は独立した出力のため、NixOS を切り替えただけではユーザー環境は適用されません。

## ディレクトリ構成

```text
.
├── flake.nix                   # 入力、ユーザー名、各構成の定義
├── flake.lock                  # Flake 入力の固定
├── hosts/
│   ├── thinkbook/              # thinkbook 固有のハードウェア設定
│   └── miyo-chan/              # miyo-chan 固有のハードウェア設定
├── nixos/
│   ├── configuration.nix       # NixOS 共通設定
│   └── modules/                # システムサービスなど
└── home-manager/
    ├── home.nix                # ユーザー環境とモジュールの入口
    └── modules/                # アプリ、シェル、デスクトップなど
```

## セットアップ

### 適用前に

- 既存の NixOS 環境、Git、`nix-command` と `flakes` が有効な Nix、管理者権限が必要です。初回のビルドでは入力やパッケージの取得にネットワークとディスク容量を使います。
- 各ホストの `hardware-configuration.nix` には、そのマシン固有のディスク UUID、カーネル、GPU などの設定があります。別のマシンにはそのまま適用せず、ハードウェア設定とブート方式を用意・確認してください。
- この設定はブートローダーやシステムサービスも変更します。TFTP の UDP 69 などのファイアウォール例外と、Tailscale インターフェースの信頼設定があります。Flatpak はシステム切り替え時にも更新されます。
- Home Manager が管理する場所に既存ファイルがある場合は、先に内容を確認してバックアップしてください。競合したファイルを自動で上書きする手順ではありません。

リポジトリを取得します。

```sh
git clone https://github.com/sunao1222/.dotfile.git ~/.dotfile
cd ~/.dotfile
```

以下はリポジトリのルートから実行します。

### NixOS

対象ホストに合う構成を選択します。まず、稼働中のシステムを切り替えずにビルドを確認します。

**thinkbook**

```sh
nix build --no-link .#nixosConfigurations.thinkbook.config.system.build.toplevel
```

**miyo-chan**

```sh
nix build --no-link .#nixosConfigurations.miyo-chan.config.system.build.toplevel
```

ビルドが成功したら、同じホストの設定を適用します。

**thinkbook**

```sh
sudo nixos-rebuild switch --flake .#thinkbook
```

**miyo-chan**

```sh
sudo nixos-rebuild switch --flake .#miyo-chan
```

`switch` は新しい設定をビルドし、システムに適用します。設定には週次の自動ガベージコレクションと、7 日より古い世代の削除も含まれるため、ロールバック可能な範囲に注意してください。

### Home Manager

`sunao1222` ユーザーで実行します。初回は Home Manager コマンドがまだなくても、Flake の activation package をビルドして適用できます。

```sh
generation="$(nix build --no-link --print-out-paths .#homeConfigurations.myHome.activationPackage)" &&
  "$generation/activate"
```

適用後は、変更の反映に Home Manager コマンドも使えます。

```sh
home-manager switch --flake .#myHome
```

既存ファイルとの競合が報告された場合は、対象を確認・退避してから再実行してください。NixOS と Home Manager の両方を変更した場合は、それぞれの切り替えが必要です。

### 設定を変更するとき

- ユーザー名やホスト出力は [`flake.nix`](flake.nix)、システム共通設定は [`nixos/configuration.nix`](nixos/configuration.nix)、ユーザー環境は [`home-manager/home.nix`](home-manager/home.nix) からたどれます。
- 別のユーザー・マシン向けには、ホストのハードウェア設定に加えて、Git のユーザー情報、Firefox の検索先、画面出力、壁紙のパスなども見直してください。[`torrc`](home-manager/modules/web-browser/torrc) にも別ユーザーの絶対パスとネットワーク無効化の設定があります。
- 依存する入力のリビジョンは [`flake.lock`](flake.lock) で固定しています。すべての入力を更新する場合は `nix flake update` を実行し、ロックファイルの差分を確認してから各構成を適用してください。
- Git 管理下の Flake では、新しく追加した設定ファイルを評価に含めるため、先に `git add` してください。

## Niri の主な操作

`Mod` は通常のセッションでは Super キーです。設定の全体は [`config.kdl`](home-manager/modules/wm/niri/config.kdl) を参照してください。

| キー | 操作 |
| --- | --- |
| `Mod` + `T` | WezTerm を開く |
| `Mod` + `D` | Walker を開く |
| `Mod` + `O` | Overview を切り替える |
| `Mod` + `H` / `J` / `K` / `L` | ウィンドウや列のフォーカスを移動 |
| `Mod` + `Q` | ウィンドウを閉じる |
| `Print` | スクリーンショット |
| `Super` + `Alt` + `L` | 画面をロック |
| `Mod` + `Shift` + `/` | ショートカット一覧を表示 |
