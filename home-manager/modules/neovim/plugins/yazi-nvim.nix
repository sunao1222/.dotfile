{ ... }:
{
  programs.nixvim.plugins = {
    yazi = {
      enable = true;
      callSetup = true;
    };
  };
}
