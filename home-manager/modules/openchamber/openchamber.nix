{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.openchamber.packages.${pkgs.system}.default
  ];
}
