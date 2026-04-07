{ pkgs, ... }:
{
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      niri = {
        prettyName = "Niri";
        binPath = "${pkgs.niri-unstable}/bin/niri";
        extraArgs = [ "--session" ];
      };
    };
  };
}
