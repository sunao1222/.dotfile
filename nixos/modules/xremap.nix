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
          name = "CapsLock is dead";
          remap = {
            CapsLock = "Ctrl_L";
          };
        }
        # {
        #   name = "Ctrl_L is SUPER";
        #   remap = {
        #     Ctrl_L = "Super_R";
        #   };
        # }
      ];
    };
  };
}
