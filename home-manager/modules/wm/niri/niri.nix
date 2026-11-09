{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri-flake.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.default;
    config = builtins.readFile ./config.kdl;
    settings = {
      layout.border.enable = true;
    };
  };

  # wayland.windowManager.niri = {
  #   enable = true;
  #   package = pkgs.niri-unstable;
  #   settings = {
  #     layout.border.enable = true;
  #   };
  #   extraConfig = builtins.readFile ./config.kdl;
  # };

  # https://github.com/nix-community/home-manager/issues/3113#issuecomment-1194271028
  home.packages = with pkgs; [
    dconf
  ];
}
