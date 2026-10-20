{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    wrappers = {
      url = "github:nix-community/nix-wrapper-modules";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    wezterm = {
      url = "github:wezterm/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    pi = {
      url = "github:earendil-works/pi";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    oh-my-pi = {
      url = "github:can1357/oh-my-pi";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    opencode = {
      url = "github:anomalyco/opencode/pull/55494/head";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    openchamber = {
      url = "github:openchamber/openchamber/pull/5154/head";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.opencode.follows = "opencode";
    };
    agent-skills = {
      url = "github:Kyure-A/agent-skills-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    i-have-adhd = {
      url = "github:ayghri/i-have-adhd";
      flake = false;
    };
    my-skills = {
      url = "github:sunao1222/agent-skills";
      flake = false;
    };
    awesome-copilot = {
      url = "github:github/awesome-copilot";
      flake = false;
    };
    anthropic-skills = {
      url = "github:anthropics/skills";
      flake = false;
    };

    niri = {
      # url = "github:sodiboo/niri-flake?rev=6bb99ff875919f03ea6054026619d999061e1170";
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    dank-greeter = {
      url = "github:AvengeMedia/dank-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    danksearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankcalendar = {
      url = "github:AvengeMedia/dankcalendar";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-scratchpad-flake = {
      url = "github:gvolpe/niri-scratchpad";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    walker = {
      url = "github:abenz1267/walker/v2.17.0";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.elephant.follows = "elephant";
    };
    elephant = {
      url = "github:JoBoCl/elephant";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    awww = {
      url = "git+https://codeberg.org/LGFae/awww";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      username = "Iras";
      overlays = [
        inputs.nur.overlays.default
        inputs.niri.overlays.niri
      ];
      pkgs = import inputs.nixpkgs-unstable {
        config.allowUnfree = true;
        inherit system overlays;
      };
      spkgs = import inputs.nixpkgs {
        config.allowUnfree = true;
        inherit system overlays;
      };
    in
    {
      nixosConfigurations = {
        myNixOS = inputs.nixpkgs-unstable.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs username spkgs;
          };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        myHome = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs username spkgs;
          };
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
