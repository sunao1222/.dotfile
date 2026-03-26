{ pkgs, ... }:
{
  services.udev = {
    enable = true;
    packages = with pkgs; [
      platformio-core.udev
    ];
  };
}
