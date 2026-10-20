{ inputs, pkgs, ... }:

{
  imports = [
    inputs.oh-my-pi.homeManagerModules.default
  ];

  programs.omp = {
    enable = true;
    package = inputs.oh-my-pi.packages.${pkgs.system}.default;
  };

  programs.zsh.initContent = builtins.readFile ./omp-completions-zsh.sh;
}
