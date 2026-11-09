{ pkgs, ... }:
let
  marp-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "marp-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nwiizo";
      repo = "marp.nvim";
      tag = "v2.0.1";
      hash = "sha256-vwlizsaImkLNUA3VgoeyO8ZnvrA/eRdHWLyt8EW6rFE";
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
      require("marp").setup({
        -- Executable and project config
        marp_command = "marp", -- string or argv list
        config_file = nil, -- path; false disables Marp config discovery
        node_options = "",

        -- Preview process
        server_mode = false, -- false: --watch, true: --server
        html_option = true,
        no_stdin = true, -- keep enabled for Neovim jobs

        -- Security: opt in only for trusted decks that need local assets
        allow_local_files = false,

        -- App used to open generated URLs; string or argv list, nil uses vim.ui.open()
        browser = nil,

        -- Browser used internally by Marp for PDF/PPTX/image conversion
        browser_kind = nil, -- "auto", "chrome", "edge", "firefox", or a list
        browser_path = nil,
        browser_protocol = nil, -- "cdp" or "webdriver-bidi"
        browser_timeout = nil, -- seconds; 0 disables the timeout

        -- HTML template
        template = nil, -- "bare" or "bespoke"
        bespoke_osc = nil,
        bespoke_progress = nil,
        bespoke_transition = nil,

        -- PDF/PPTX
        pdf_notes = false,
        pdf_outlines = false,
        pdf_outlines_pages = nil,
        pdf_outlines_headings = nil,
        pptx_editable = false,

        -- Images and themes
        image_scale = 1,
        jpeg_quality = 85,
        theme_set = {},
        themes = {
          default = "default",
          gaia = "gaia",
          uncover = "uncover",
        },

        -- Notifications
        auto_copy_path = true,
        show_file_size = true,
        suggest_gitignore = true,
        debug = false,
      })
    '';
  };
}
