{ inputs, pkgs, ... }:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.nixosModules.default
    inputs.dux-search.homeModules.default
    inputs.dux-calendar.homeModules.default
    inputs.dms.homeModules.niri
  ];

  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true;
    systemd.enable = true;
    niri = {
      enableKeybinds = true;
    };
    plugins = {
      githubHeatmapPlus.enable = true;
      audioFx = {
        enable = true;
        settings = {
          username = "sunao1222";
        };
      };
      chatManager.enable = true;
      dankTranslateAI = {
        enable = true;
        settings = {
          localBaseUrl = "http://localhost:8081/v1";
          localEndpoint = "/chat/completions";
          localModel = "unsloth/gemma-4-E2B-it-qat-GGUF:UD-Q4_K_XL";
          targetLanguage = "Japanese";
        };
      };
    };
  };

  programs.dsearch = {
    enable = true;
  };
  programs.dank-calendar = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    python3
    go
    jq
    libnotify
    xdg-utils
  ];
}
