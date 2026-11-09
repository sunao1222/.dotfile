{ inputs, ... }:
{
  imports = [
    inputs.tiny.homeManagerModules.default
  ];

  programs.tiny = {
    enable = true;
  };
}
