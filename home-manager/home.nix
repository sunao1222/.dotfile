{config, username, pkgs, spkgs, ...}: {

  home = rec {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.anytype
    pkgs.blender
    pkgs.brightnessctl
    pkgs.calcurse
    pkgs.feishin
    pkgs.freecad-wayland
    pkgs.gemini-cli
    pkgs.glide-media-player
    pkgs.grimblast
    pkgs.image-roll
    pkgs.impala
    pkgs.mpv
    pkgs.mysql-workbench
    pkgs.nmgui
    pkgs.orca-slicer
    pkgs.pavucontrol
    pkgs.ranger
    pkgs.realvnc-vnc-viewer
    pkgs.remmina
    pkgs.screen
    pkgs.slack
    pkgs.spotify
    pkgs.termusic
    pkgs.waydroid-helper
    pkgs.zathura
    pkgs.drawio
    pkgs.kicad
    pkgs.parsec-bin
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

  programs = {
    awscli = {
      enable = true;
      package = spkgs.awscli;
    };
  };

  services.mpris-proxy = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
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
