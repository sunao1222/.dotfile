{ inputs, config, ... }:
{
  imports =[ inputs.dux-greeter.nixosModules.default ];

  programs.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };

  security.pam.services.greetd = {
    fprintAuth = config.services.fprintd.enablePam;
    u2fAuth = true;
  };
}
