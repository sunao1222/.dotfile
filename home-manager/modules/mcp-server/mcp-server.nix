{ inputs, pkgs, ... }:

{
  imports = [
    inputs.mcp-server-nix.homeManagerModules.default
  ];

  programs.mcp = {
    enable = true;
  };

  mcp-servers = {
    programs = {
      filesystem = {
        enable = true;
      };
    };
    settings.servers = {
      drawio-mcp = {
        command = "${pkgs.lib.getExe' pkgs.nodejs "npx"}";
        args = [
          "-y"
          "drawio/mcp"
        ];
        env = {
          PATH = "${pkgs.nodejs}/bin:$PATH";
        };
      };
    };
  };
}
