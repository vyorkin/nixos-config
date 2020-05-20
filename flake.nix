{
  description = "NixOS configuration of vyorkin's machines";

  inputs = {
    nixpkgs = {
      type = "indirect";
      id = "nixpkgs";
    };

    # Previous stable version of nixpkgs
    nixpkgs-old = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-19.03";
      flake = false;
    };

    # Provides a basic system for managing a user environment
    # using the Nix package manager together with the Nix
    # libraries found in Nixpkgs: https://github.com/rycee/home-manager
    home-manager = {
      type = "github";
      owner = "rycee";
      repo = "home-manager";
      ref = "bqv-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS profiles covering hardware quirks:
    # https://github.com/NixOS/nixos-hardware
    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
      flake = false;
    };

    # Community-driven meta repository for Nix packages:
    # https://github.com/nix-community/NUR In contrast to
    # Nixpkgs, packages are built from source and are not
    # reviewed by any Nixpkgs member. Allows to share new
    # packages from the community in a faster and more
    # decentralized way
    NUR = {
      type = "github";
      owner = "nix-community";
      repo = "NUR";
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
      type = "indirect";
      id = "secrets";
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
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = with nixpkgs.lib;
    let
      hosts = map (fname: builtins.head (builtins.match "(.*)\\.nix" fname))
      (builtins.attrNames (builtins.readDir ./hosts));
      mkHost = name:
      nixosSystem {
        system = "x86_64-linux";
        modules = [(import ./default.nix)];
        specialArgs = { inherit inputs name; };
      };
    in genAttrs hosts mkHost;
  };
}