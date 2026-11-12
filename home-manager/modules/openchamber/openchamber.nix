{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.openchamber.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
