{
  description = "NixOS configuration of vyorkin's hosts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-21-11 = {
      type = "github";
      owner = "nixos";
      repo = "nixpkgs";
      ref = "nixos-21.11";
      flake = false;
    };

    # Nix-flakes deployment tool
    deploy-rs.url = "github:serokell/deploy-rs";

    # Provides a basic system for managing a user environment
    # using the Nix package manager together with the Nix
    # libraries found in Nixpkgs: https://github.com/rycee/home-manager
    home-manager.url = "github:rycee/home-manager";

    # NixOS profiles covering hardware quirks:
    # https://github.com/NixOS/nixos-hardware
    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
      flake = false;
    };

    # Automated, pre-built packages for Wayland (sway/wlroots)
    nixpkgs-wayland = {
      url = "github:colemickens/nixpkgs-wayland";
    };

    # Bleeding edge Emacs
    emacs.url = "github:nix-community/emacs-overlay";

    # LSB&FHS compatibility for NixOS.
    # Intended for containers and VMs.
    # https://github.com/balsoft/nixos-fhs-compat
    nixos-fhs-compat.url = "github:balsoft/nixos-fhs-compat";

    # The Nix User Repository - community-driven meta repository for Nix packages
    NUR = {
      url = "github:nix-community/NUR";
      flake = false;
    };

    # Modules to help you handle persistent state on systems with ephemeral root storage
    impermanence.url = "github:nix-community/impermanence";

    # A few Nix expressions suitable for inclusion in Nix User Repository
    rycee = {
      url = "gitlab:rycee/nur-expressions";
      flake = false;
    };

    # A faster, persistent implementation of direnv's use_nix, to replace the built-in one
    nix-direnv = { url = "github:nix-community/nix-direnv"; };

    # Official repository for community contributed blocklets 
    i3blocks-contrib = {
      type = "github";
      owner = "vivien";
      repo = "i3blocks-contrib";
      flake = false;
    };

    # CLI email client
    himalaya.url = "github:soywod/himalaya";

    nheko = {
      url = "github:nheko-reborn/nheko";
      flake = false;
    };

    mtxclient ={
      url = "github:nheko-reborn/mtxclient";
      flake = false;
    };

    kitty-themes = {
      type = "github";
      owner = "dexpota";
      repo = "kitty-themes";
      flake = false;
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

    nix-zsh-completions = {
      type = "github";
      owner = "spwhitt";
      repo = "nix-zsh-completions";
      flake = false;
    };

    ghacks = {
      type = "github";
      owner = "ghacksuserjs";
      repo = "ghacks-user.js";
      flake = false;
    };

    secrets = {
      url = "git+ssh://git@github.com/vyorkin/dotsecrets.git";
      flake = false;
    };

    git-config = {
      url = "git+ssh://git@github.com/vyorkin/gitconfig.git";
      flake = false;
    };

    zsh-config = {
      type = "github";
      owner = "vyorkin";
      repo = "zshrc";
      flake = false;
    };

    tmux-config = {
      type = "github";
      owner = "vyorkin";
      repo = "tmux.conf";
      flake = false;
    };

    tpm = {
      type = "github";
      owner = "tmux-plugins";
      repo = "tpm";
      flake = false;
    };

    vim-config = {
      type = "github";
      owner = "vyorkin";
      repo = "vimrc";
      flake = false;
    };

    emacs-config = {
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

      nodes.notbad = {
        hostname =
	  self.nixosConfigurations.notbad.config.networking.hostName;
	profiles.system.path = deploy-rs.x86_64-linux.activate.nixos
	  self.nixosConfigurations.notbad;
      };
    };
  };
}
