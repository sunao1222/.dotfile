{ inputs, ... }:
{
  imports = [ inputs.serpantinum.homeManagerModules.default ];

  programs.serpantinum = {
    enable = true;
    systemd.enable = true;
  };
}
