{ pkgs, ... }:
{
  # sound config
  services.pulseaudio.enable = false;
  hardware.alsa.enablePersistence = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    package = pkgs.pipewire.override { bluezSupport = true; };
    extraConfig = {
      pipewire = {
        "99-hires.conf" = {
          "context.properties" = {
            "default.clock.rate" = 96000;
            "default.clock.allowed-rates" = [ 96000 ];
            "default.clock.quantum" = 4096;
          };
        };
      };
      };
    wireplumber = {
      enable = true;
      extraConfig = {
        bluetoothEnhancements = {
          "monitor.bluez.properties" = {
            "bluez5.default.rate" = 96000;
          };
        };
      };
    };
    alsa = {
      enable = true;
      support32Bit = true;
    };
    # jack.enable = true;
    pulse.enable = true;
  };
}
