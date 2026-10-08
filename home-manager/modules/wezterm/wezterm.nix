{ inputs, pkgs, ... }:
{
  imports = [
    (inputs.wrappers.lib.getInstallModule {
      name = "wezterm";
      value = inputs.wrappers.lib.wrapperModules.wezterm;
    })
  ];

  wrappers.wezterm = { pkgs, lib, ... }: {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    "wezterm.lua".path = ./wezterm.lua;
  };
}
