{ lib, pkgs, inputs, ... }:

{
  environment.etc.nixpkgs.source = inputs.nixpkgs;

  nix = {
    # Needed for nix-shell to work without channels
    nixPath = lib.mkForce [ "nixpkgs=/etc/nixpkgs" ];

    # Enable nix-flakes
    registry = {
      self.flake = inputs.self;
      emacs.flake = inputs.emacs;
    };
    package = inputs.nix.packages.x86_64-linux.nix;

    extraOptions = ''
      experimental-features = nix-command flakes

      keep-outputs = true
      cores = 4
      connect-timeout = 3
      max-jobs = 6
      min-free = ${toString (500 * 1024 * 1024)}
      max-free = ${toString (5 * 1024 * 1024 * 1024)}
    '';

    # Enable automatic garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    optimise = {
      # Automatically run the nix optimiser at a specific time
      automatic = true;
      dates = [ "07:00" ];
    };

    # Number of nixbld user accounts created to perform secure
    # concurrent builds. If you receive an error message saying that
    # "all build users are currently in use", you should increase this value
    nrBuildUsers = 16;

    settings = {
      # Detect files in the store that have identical contents,
      # and replace them with hard links to a single copy.
      auto-optimise-store = true;

      trusted-substituters = [
        "http://hydra.nixos.org"
        "http://cache.nixos.org"

        "https://nix-community.cachix.org"
        "https://nixpkgs-wayland.cachix.org"
        "https://nixcache.reflex-frp.org"
        "https://nixfmt.cachix.org"
        "https://all-hies.cachix.org"
        "https://iohk.cachix.org"
        "https://ghcide-nix.cachix.org"
        "https://cache.dhall-lang.org"
        "https://dhall.cachix.org"
        "https://bs-platform.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
        "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
      ];
    };
  };
}
