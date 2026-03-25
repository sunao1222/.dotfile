{ pkgs, ... }:
let
  marp-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "marp-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nwiizo";
      repo = "marp.nvim";
      tag = "v1.2.0";
      sha256 = "oDdCzRmpgRqX1MoSTff+JSpgQeCjy+uQjl8qm7qpxYw=";
    };
  };
in
{
  programs.nixvim = {
    extraPlugins = [
      marp-nvim
    ];
    extraPackages = with pkgs; [
      marp-cli
    ];
    extraConfigLua = ''
      require('marp').setup({
        -- Marp CLIコマンド（デフォルト: "marp"、PATH上のmarpを自動検出）
        marp_command = "marp",

        -- ブラウザコマンド（nil = 自動検出）
        browser = nil,

        -- 利用可能なテーマ
        themes = {
            default = "default",
            gaia = "gaia",
            uncover = "uncover"
          },
        
        -- エクスポート形式
        export_formats = {
            html = "--html",
            pdf = "--pdf",
            pptx = "--pptx",
            png = "--images png",
            jpeg = "--images jpeg"
          },
        
        -- 新機能
        show_tips = true,           -- 便利なヒントを表示
        auto_copy_path = true,      -- ファイルパスを自動でクリップボードにコピー
        show_file_size = true,      -- エクスポート後にファイルサイズを表示
        suggest_gitignore = true,   -- *.htmlを.gitignoreに追加するよう提案
        debug = false,              -- デバッグログを有効化（トラブルシューティングに便利）
        server_mode = false,        -- サーバーモード(-s)またはウォッチモード(--watch)を使用
          html_option = true          -- ウォッチモードで--htmlオプションを使用（デフォルト: true）
      })
    '';
  };
}
