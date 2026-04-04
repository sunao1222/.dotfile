{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
  ];
  
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    config = builtins.readFile ./config.kdl;
  };

  # https://github.com/nix-community/home-manager/issues/3113#issuecomment-1194271028
  home.packages = with pkgs; [
    dconf
  ];
}
