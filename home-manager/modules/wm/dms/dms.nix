{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.danksearch.homeModules.dsearch
    inputs.dms.homeModules.niri
  ];

  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true;
    dgop.package = inputs.dgop.packages.${pkgs.system}.default;
    systemd.enable = true;
    niri = {
      enableKeybinds = true;
      enableSpawn = true;
    };
  };

  programs.dsearch = {
    enable = true;
  };
}
