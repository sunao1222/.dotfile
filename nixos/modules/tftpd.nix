{ ... }:

{
  services.atftpd = {
    enable = true;
  };

  networking.firewall = {
    allowedUDPPorts = [ 69 ];
  };
}
