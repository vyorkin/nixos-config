{
  description = "NixOS configuration of vyorkin's machines";

  edition = 201909;

  inputs = {
    nixpkgs = {
      type = "indirect";
      id = "nixpkgs";
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
