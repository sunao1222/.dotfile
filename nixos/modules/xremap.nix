{ inputs, username, ... }:
{
  imports = [
    inputs.xremap.nixosModules.default
  ];

  services.xremap = {
    enable = true;
    userName = "${username}";
    serviceMode = "system";
    withNiri = true;
    config = {
      modmap = [
        {
          name = "Change CapsLock Ctrl_L";
          remap = {
            Ctrl_L = "CapsLock";
            CapsLock = "Ctrl_L";
          };
        }
      ];
    };
  };
}
