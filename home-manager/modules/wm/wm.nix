{
  inputs,
  username,
  pkgs,
  ...
}:
let
  inherit (inputs.niri-scratchpad-flake.packages.${pkgs.system}) niri-scratchpad;
in
{
  imports = [
    ./dms/dms.nix
    ./niri/niri.nix
    ./walker/walker.nix
  ];

  # programs.waybar = {
  #   enable = true;
  #   systemd = {
  #     enable = true;
  #   };
  #   settings = import ./waybar.nix;
  #   style = builtins.readFile ./waybar.css;
  # };

  services.swaync = {
    enable = true;
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    Unit = {
      Description = "polkit-gnome-authentication-agent-1";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  home.packages = [
    niri-scratchpad
    pkgs.nautilus
    # pkgs.polkit_gnome
    pkgs.valent
    pkgs.wl-mirror
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  services = {
    awww = {
      enable = true;
      package = inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww;
    };
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "/home/${username}/Pictures/wallpaper/WhiteGlint.jpg"
          "/home/${username}/Pictures/wallpaper/b-077.jpg"
          "/home/${username}/Pictures/wallpaper/nix-wallpaper-stripes-logo.png"
        ];
        wallpaper = [
          "eDP-1, /home/${username}/Pictures/wallpaper/nix-wallpaper-stripes-logo.png"
          "DP-2, /home/${username}/Pictures/wallpaper/WhiteGlint.jpg"
          "HDMI-A-1, /home/${username}/Pictures/wallpaper/nix-wallpaper-stripes-logo.png"
        ];
      };
    };
  };
}
