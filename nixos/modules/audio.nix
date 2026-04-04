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
        adfust-sample-rate = {
          "context.properties" = {
            "default.clock.rate" = 96000;
            #"default.allowed-rates" = [ 96000 88200 48000 44100 ];
            "default.allowed-rates" = [ 96000 ];
            #"default.clock.quantum" = 4096;
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
