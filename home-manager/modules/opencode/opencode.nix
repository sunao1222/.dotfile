{ inputs, lib, pkgs, ... }:
{
  imports = [
    (inputs.wrappers.lib.getInstallModule {
      name = "opencode";
      value = inputs.wrappers.lib.wrapperModules.opencode;
    })
  ];

  wrappers.opencode = { ... }: {
    enable = true;
    package = inputs.opencode.packages.${pkgs.system}.default;
    settings = lib.importJSON ./opencode.json;
    tui-settings = lib.importJSON ./tui.json;
  };
}
