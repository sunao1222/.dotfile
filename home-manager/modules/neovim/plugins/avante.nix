{
  programs.nixvim = {
    plugins = {
      avante = {
        enable = true;
        settings = {
          input = {
            provider = "snacks";
            provider_opts = {
              title = "Avante Input";
              icon = " ";
            };
          };
          provider = "sakura";
          providers = {
            sakura = {
              __inherited_from = "openai";
              endpoint = "https://api.ai.sakura.ad.jp/v1/chat/completions";
              auth_type = "api";
              # model = "Qwen3-Coder-480B-A35B-Instruct-FP8";
              # timeout = 30000;
              # extra_request_body = {
              #   max_tokens = 20480;
              #   temperature = 0.75;
              # };
            };
          };
        };
      };
    };
  };
}
