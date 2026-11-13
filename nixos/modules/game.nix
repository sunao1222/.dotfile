{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      migu
    ];
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
