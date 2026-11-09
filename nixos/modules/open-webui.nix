{ spkgs, ... }:
{
  services = {
    open-webui = {
      enable = true;
      package = spkgs.open-webui;
      host = "127.0.0.1";
      port = 11111;
    };
  };
}
