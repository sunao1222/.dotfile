{ inputs, lib, pkgs, ... }:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      niri = {
        prettyName = "Niri";
        binPath = lib.getExe inputs.niri.packages.${pkgs.system}.default;
        extraArgs = [ "--session" ];
      };
    };
  };
}
