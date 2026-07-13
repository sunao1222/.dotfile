{ pkgs, ... }:
{
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp-vulkan;
      settings = {
      hf-repo = "unsloth/gemma-4-E2B-it-qat-GGUF:UD-Q4_K_XL";
      port = 8081;
      spec-type = "draft-mtp";
      spec-draft-n-max = 2;
      top-p = 0.95;
      top-k = 64;
      chat-template-kwargs = "\'{\"enable_thinking\":false}\'";
      jinja = true;
    };
    };
  systemd.services.llama-cpp = {
    environment = {
      XDG_CACHE_HOME = "/var/cache/llama-cpp";
      MESA_SHADER_CACHE_DIR = "/var/cache/llama-cpp";
    };
  };
}
