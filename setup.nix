{ pkgs, options, ... }:

let
  const = import ./const.nix;
  host = import ./host.nix;

  pushToCachix = if const.cachix.push then
    "post-build-hook = ${
      pkgs.writeShellScript "upload-to-cachix" ''
        export HOME=/root
        echo $OUT_PATHS | ${pkgs.cachix}/bin/cachix push ${host.name} --config /root/.config/cachix/cachix.dhall
      ''
    }"
  else
    "";
in {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  system = {
    # Periodically upgrade NixOS to the latest version.
    # systemd timer will run nixos-rebuild switch --upgrade once a day
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      dates = "6:00";
    };

    # Use default versions of packages of NixOS 20.03
    stateVersion = "20.03";
  };

  nix = {
    # Perform builds in a sandboxed environment that it will set
    # up automatically for each build. This prevents impurities
    # in builds by disallowing access to dependencies outside o
    # the Nix store by using network and mount namespaces in a chroot environment
    useSandbox = true;

    # Enforce the immutability of the Nix store by making
    # /nix/store a read-only bind mount. Nix will automatically
    # make the store writable when needed
    readOnlyStore = true;

    # Only download binaries from binary caches if they are
    # cryptographically signed with any of the keys listed in nix.binaryCachePublicKeys
    requireSignedBinaryCaches = true;

    # Use flakes instead of channels/submodules/niv
    # RFC: https://github.com/tweag/rfcs/blob/flakes/rfcs/0049-flakes.md
    # Talk by Eelco Dolstra: https://www.youtube.com/watch?v=UeBX7Ide5a0
    package = pkgs.nixFlakes;

    # Enable automatic garbage collection
    gc = {
      automatic = true;
      dates = "07:30";
      options = "--delete-older-than 7d";
    };

    # Number of nixbld user accounts created to perform secure
    # concurrent builds. If you receive an error message saying that
    # “all build users are currently in use”, you should increase this value
    nrBuildUsers = 16;

    # Additional text appended to `nix.conf`.
    # Flake support is still experimental, so we need to go
    # through a couple of extra hoops to enable it
    extraOptions = ''
      experimental-features = nix-command flakes

      auto-optimise-store = true
      keep-outputs = true
      keep-derivations = true
      http-connections = 10

      ${pushToCachix}
    '';

    trustedBinaryCaches = [
      "http://hydra.nixos.org"
      "http://cache.nixos.org"

      "https://nixfmt.cachix.org"
      "https://all-hies.cachix.org"
      "https://iohk.cachix.org"
      "https://ghcide-nix.cachix.org"
      "https://cache.dhall-lang.org"
      "https://dhall.cachix.org"

      "https://silence.cachix.org"
      "https://shelter.cachix.org"
    ];

    binaryCachePublicKeys = [
      "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="

      "silence.cachix.org-1:os5cpvGmIPGBs7iKjQhD/S+pRS6fTOdSC6BxUi7/P1w="
      "shelter.cachix.org-1:cXcy+gjaAQfUNGNgR+9ZTkGCLDw0yLHXTSRetWQy98U="
    ];
  };
}
