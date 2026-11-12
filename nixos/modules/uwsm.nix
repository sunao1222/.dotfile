{ inputs, lib, pkgs, ... }:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      niri = {
        prettyName = "Niri";
        binPath = lib.getExe inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.default;
        extraArgs = [ "--session" ];
      };
    };
  };
}
