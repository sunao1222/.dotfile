{ inputs, ... }:
{
  imports = [
    (inputs.wrappers.lib.getInstallModule {
      name = "opencode";
      value = inputs.wrappers.lib.wrapperModules.opencode;
    })
  ];

  wrappers.opencode = { lib, ... }: {
    enable = true;
    settings = lib.importJSON ./opencode.json;
    tui-settings = lib.importJSON ./tui.json;
  };
}
