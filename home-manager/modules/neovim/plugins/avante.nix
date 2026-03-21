{
  programs.nixvim = {
    plugins = {
      avante = {
        enable = true;
        settings = {
          provider = "llama-cpp";
          providers = {
            llama-cpp = {
              __inherited_from = "openai";
              endpoint = "http://ume-chan:8080/v1";
              model = "Qwen3-Coder-30B-A3B-Instruct-Q4_K_M.gguf";
              disable_tools = true;
              # extra_request_body = {
              #   max_tokens = 4096;
              #   temperature = 0;
              # };
              # model = "claude-3-5-sonnet-20240620";
            };
          };
        };
      };
    };
  };
}
