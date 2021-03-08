{
  description = "NixOS configuration of vyorkin's hosts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-20-09 = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-20.09";
      flake = false;
    };

    nixpkgs-20-03 = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-20.03";
      flake = false;
    };

    nixpkgs-19-03 = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-19.03";
      flake = false;
    };

    # Nix-flakes deployment tool
    deploy-rs.url = "github:serokell/deploy-rs";

    # Provides a basic system for managing a user environment
    # using the Nix package manager together with the Nix
    # libraries found in Nixpkgs: https://github.com/rycee/home-manager
    home-manager = {
      type = "github";
      owner = "rycee";
      repo = "home-manager";
      ref = "master";
    };

    # NixOS profiles covering hardware quirks:
    # https://github.com/NixOS/nixos-hardware
    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
      flake = false;
    };

    # Automated, pre-built packages for Wayland (sway/wlroots)
    # tools for NixOS: https://github.com/colemickens/nixpkgs-wayland
    nixpkgs-wayland = {
      type = "github";
      owner = "colemickens";
      repo = "nixpkgs-wayland";
      flake = false;
    };

    # LSB&FHS compatibility for NixOS.
    # Intended for containers and VMs.
    # https://github.com/balsoft/nixos-fhs-compat
    nixos-fhs-compat = {
      type = "github";
      owner = "balsoft";
      repo = "nixos-fhs-compat";
    };

    weechat-scripts = {
      type = "github";
      owner = "weechat";
      repo = "scripts";
      flake = false;
    };

    weechat-notify-send = {
      type = "github";
      owner = "s3rvac";
      repo = "weechat-notify-send";
      flake = false;
    };

    materia-theme = {
      type = "github";
      owner = "nana-4";
      repo = "materia-theme";
      flake = false;
    };

    ghacks = {
      type = "github";
      owner = "ghacksuserjs";
      repo = "ghacks-user.js";
      flake = false;
    };

    kitty-themes = {
      type = "github";
      owner = "dexpota";
      repo = "kitty-themes";
      flake = false;
    };

    base16-kitty = {
      type = "github";
      owner = "kdrag0n";
      repo = "base16-kitty";
      flake = false;
    };

    secrets = {
      url = "git+ssh://git@github.com/vyorkin/dotsecrets.git";
      flake = false;
    };

    zsh = {
      type = "github";
      owner = "vyorkin";
      repo = "zshrc";
      flake = false;
    };

    tmux = {
      type = "github";
      owner = "vyorkin";
      repo = "tmux.conf";
      flake = false;
    };

    vim = {
      type = "github";
      owner = "vyorkin";
      repo = "vimrc";
      flake = false;
    };

    emacs = {
      type = "github";
      owner = "vyorkin";
      repo = "emacs.d";
      flake = false;
    };

    dotpryrc = {
      type = "github";
      owner = "vyorkin";
      repo = "dotpryrc";
      flake = false;
    };

    nixos-artwork = {
      type = "github";
      owner = "nixos";
      repo = "artwork";
      flake = false;
    };
  };

  outputs = { nixpkgs, nix, self, deploy-rs, ... }@inputs: {
    nixosModules = import ./modules;
    nixosProfiles = import ./profiles;
    nixosConfigurations = with nixpkgs.lib;
      let
        hosts = builtins.attrNames (builtins.readDir ./hosts);
        mkHost = name:
            nixosSystem {
              system = removeSuffix "\n" (builtins.readFile (./hosts + "/${name}/system"));
              modules = [(import (./hosts + "/${name}"))];
              specialArgs = { inherit inputs; };
            };
      in genAttrs hosts mkHost;

    legacyPackages.x86_64-linux =
      (builtins.head (builtins.attrValues self.nixosConfigurations)).pkgs;

    defaultApp = deploy-rs.defaultApp;

    deploy = {
      user = "root";
      nodes.autism = {
        hostname =
	  self.nixosConfigurations.autism.config.networking.hostName;
	profiles.system.path = deploy-rs.x86_64-linux.activate.nixos
	  self.nixosConfigurations.autism;
      };
    };
  };
}
