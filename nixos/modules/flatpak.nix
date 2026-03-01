{ inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
    overrides = {
      global = {
        Context.filesystems = [ "/nix/store:ro" ];
        Environment = {
          GTK_THEME = "Tokyonight-Dark";
        };
      };
    };
    packages = [
      "com.discordapp.Discord"
      "org.vinegarhq.Vinegar"
      "com.vba_m.visualboyadvance-m"
    ];
  };
}
