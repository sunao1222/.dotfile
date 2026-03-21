{ pkgs, ... }:
let
  codegpt = pkgs.buildGoModule {
    pname = "codegpt";
    version = "1.2.1";

    src = pkgs.fetchFromGitHub {
      owner = "appleboy";
      repo = "CodeGPT";
      tag = "v1.2.1";
      hash = "sha256-Q89CTNbLp0QXaiOubCRAPM7RqMwVJkIAKy3Nr4S5GYc=";
    };

    nativeBuildInputs = [ pkgs.git ];

    vendorHash = "sha256-sihfhavfPoha8tiiV7+icPYEZkp7ZRx1wgJCYiQvJeI=";
  };
  czg = pkgs.stdenv.mkDerivation (finalAttrs: {
    pname = "czg";
    version = "1.12.0";

    src = pkgs.fetchFromGitHub {
      owner = "Zhengqbbb";
      repo = "cz-git";
      tag = "v1.12.0";
      hash = "sha256-8qYZ9Dc35AsfW4k6c0JNap2G9uLBY8Uw/TXqzo9GnoI=";
    };

    nativeBuildInputs = [
      pkgs.nodejs
      pkgs.pnpm.configHook
    ];

    pnpmDeps = pkgs.pnpm.fetchDeps {
      inherit (finalAttrs) pname version src;
      # sourceRoot = "${finalAttrs.src.name}/packages/cli";
      fetcherVersion = 2;
      hash = "sha256-wdXuKjsx3rAiftOHCYvpl3uQDFrJwAyzTm0t+30UeLM=";
    };
    # pnpmRoot = "cli";

    installPhase = ''
      mkdir $out
    '';
  });
in
{

  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "sunao1222";
        user.email = "g024c1054@g.neec.ac.jp";
        init.defaultBranch = "main";
      };
    };

    gh = {
      enable = true;
      extensions = [
        pkgs.gh-markdown-preview
      ];
      settings = {
        editor = "nvim";
      };
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          showIcons = true;
          nerdFontsVersion = "3";
        };
        git = {
          autoFetch = false;
        };
        os = {
          editPreset = "nvim";
        };
      };
    };
  };

  home.packages = [
    codegpt
    czg
  ];

  home.shellAliases = {
    lg = "lazygit";
  };

  xdg.configFile = {
    "codegpt.yaml" = {
      source = ./.codegpt.yaml;
      target = "codegpt/.codegpt.yaml";
    };
  };
}
