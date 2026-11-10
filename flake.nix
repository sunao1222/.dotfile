{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
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
    mcp-server-nix = {
      url = "github:natsukium/mcp-servers-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    agent-skills = {
      url = "github:sunao1222/agent-skills-nix/?ref=feature/oh-my-pi-skill-target";
      # url = "github:Kyure-A/agent-skills-nix";
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
    laravel = {
      url = "github:laravel/agent-skills";
      flake = false;
    };
    agent-toolkit = {
      url = "github:softaworks/agent-toolkit";
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
      url = "github:niri-wm/niri";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    niri-nix = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    niri-flake = {
      # url = "github:sodiboo/niri-flake?rev=6bb99ff875919f03ea6054026619d999061e1170";
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    dms = {
      url = "github:duxlabs-dev/dux-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    dms-plugin-registry = {
      url = "github:duxlabs-dev/dux-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    dux-gop = {
      url = "github:duxlabs-dev/dux-gop";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    dux-greeter = {
      url = "github:duxlabs-dev/dux-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dux-search = {
      url = "github:duxlabs-dev/dux-search";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dux-calendar = {
      url = "github:duxlabs-dev/dux-calendar?ref=stable-2.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    serpantinum = {
      url = "github:ilyamiro/serpantinum";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
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

    mermark-editor = {
      # url = "github:sunao1222/MerMarkEditor?ref=feature/nix-flake-package";
      url = "github:Vesperino/MerMarkEditor?ref=v0.8.4";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    tiny = {
      url = "github:sunao1222/tiny?ref=feature/tui-server-channel-groups";
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
      username = "sunao1222";
      overlays = [
        inputs.nur.overlays.default
        inputs.niri-flake.overlays.niri
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
        thinkbook = inputs.nixpkgs-unstable.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs username spkgs;
            nixosConfigurationName = "myNixOS";
          };
          modules = [
            ./nixos/configuration.nix
            ./hosts/thinkbook/hardware-configuration.nix
          ];
        };
        miyo-chan = inputs.nixpkgs-unstable.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit inputs username spkgs;
            nixosConfigurationName = "miyo-chan";
          };
          modules = [
            ./nixos/configuration.nix
            ./hosts/miyo-chan/hardware-configuration.nix
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
