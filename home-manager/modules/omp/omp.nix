{ inputs, pkgs, ... }:

{
  imports = [
    inputs.oh-my-pi.homeManagerModules.default
  ];

  programs.omp = {
    enable = true;
    package = inputs.oh-my-pi.packages.${pkgs.system}.default;
    settings = {
      github.enabled = true;
      statusLine.preset = "nerd";
      theme.dark = "dark-tokyo-night";
      tui.vimMode = true;
      modelRoles.default = "openai-codex/gpt-6.1-terra";
      symbolPreset = "nerd";
      composer.shape = "borderless";
      setupVersion = 2;
      dev.autoqaConsent = "granted";
    };
  };

  programs.zsh.initContent = builtins.readFile ./omp-completions-zsh.sh;
}
