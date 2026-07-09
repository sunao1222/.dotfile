{
  lib,
  config,
  username,
  pkgs,
  spkgs,
  ...
}:
{
  imports = [
    ./modules/btop/btop.nix
    ./modules/cursor/cursor.nix
    ./modules/devOps/devOps.nix
    ./modules/ghostty/ghostty.nix
    ./modules/git/git.nix
    ./modules/im/im.nix
    ./modules/ncspot/ncspot.nix
    ./modules/neovim/neovim.nix
    ./modules/obsidian/obsidian.nix
    ./modules/opencode/opencode.nix
    ./modules/prismlauncher/prismlauncher.nix
    ./modules/ssh/ssh.nix
    ./modules/trayscale/trayscale.nix
    ./modules/taskwarrior/taskwarrior.nix
    ./modules/web-browser/web-browser.nix
    ./modules/wezterm/wezterm.nix
    ./modules/wm/wm.nix
    ./modules/yazi/yazi.nix
    ./modules/zsh/zsh.nix
  ];


  home = rec {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    anytype
    blender
    brightnessctl
    calcurse
    cisco-packet-tracer_9
    drawio
    feishin
    freecad-wayland
    gemini-cli
    glide-media-player
    grimblast
    image-roll
    impala
    kicad
    mpv
    mysql-workbench
    nmgui
    orca-slicer
    parsec-bin
    pavucontrol
    picocom
    ranger
    realvnc-vnc-viewer
    remmina
    screen
    slack
    spotify
    termusic
    waydroid-helper
    zathura
  ];

  home.sessionVariables = {
    TERMINAL = "${pkgs.wezterm}/bin/wezterm";
    BROWSER = "${pkgs.firefox}/bin/firefox";
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
    };
  };

  programs = {
    cava = {
      enable = true;
    };
    cavalier = {
      enable = true;
    };
  };

  services.mpris-proxy = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
    automount = false;
    settings = {
      program_options = {
        file_manager = "${pkgs.yazi}/bin/yazi";
      };
    };
  };

  home.file = {
    ".config/ranger/rc.conf".text = ''
      set preview_images true
      set preview_images_method iterm2
    '';
  };
}
