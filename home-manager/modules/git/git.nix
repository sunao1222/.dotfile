{ pkgs, ... }:
let
  codegpt = pkgs.buildGoModule rec {
    pname = "codegpt";
    version = "1.2.1";

    src = pkgs.fetchFromGitHub {
      owner = "appleboy";
      repo = "CodeGPT";
      tag = "v${version}";
      hash = "sha256-Q89CTNbLp0QXaiOubCRAPM7RqMwVJkIAKy3Nr4S5GYc=";
    };

    nativeBuildInputs = [
      pkgs.git
    ];

    vendorHash = "sha256-sihfhavfPoha8tiiV7+icPYEZkp7ZRx1wgJCYiQvJeI=";
  };

  czg = pkgs.stdenv.mkDerivation rec {
    pname = "czg";
    version = "1.13.1";

    src = pkgs.fetchFromGitHub {
      owner = "Zhengqbbb";
      repo = "cz-git";
      tag = "v${version}";
      hash = "sha256-h9osG6cs7T1GxC9r8SWAJKbKYIWd06ZdeNJhSS5dkks=";
    };

    nativeBuildInputs = [
      pkgs.nodejs
      pkgs.pnpm.configHook
      pkgs.pnpm
    ];
    
    buildInputs = [
      pkgs.nodejs
    ];

    pnpmDeps = pkgs.pnpm.fetchDeps {
      inherit pname version src;
      fetcherVersion = 4;
      hash = "sha256-JHNb/7xBB1mKDIyFMEnkNxsvoiIvT4ePqJIq7JsTXtk=";
    };

    buildPhase = ''
      runHook preBuild
      pnpm build
      runHook postBuild
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp ./packages/cli/bin/index.js $out/bin/czg
      cp -r ./packages/cli/lib $out
    '';
  };
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
