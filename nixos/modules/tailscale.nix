{ config, username, ... }:
{
  # tailscale（VPN）を有効化
  services.tailscale = {
    enable = true;
    extraSetFlags = [ "--operator=${username}" ];
  };

  networking.firewall = {
    # tailscaleの仮想NICを信頼する
    # `<Tailscaleのホスト名>:<ポート番号>`のアクセスが可能になる
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
    checkReversePath = "loose";
  };
}
