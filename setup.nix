{ config, pkgs, lib, options, modulesPath }:

let
  path = ./overlays;
  content = builtins.readDir path;
  # upload-to-cachix = builtins.readFile ./hooks/upload-to-cachix.sh;
in {
  nix.nixPath = [
    "nixpkgs=/etc/nixos/pkgs/nixpkgs"
    "nixpkgs-overlays=/etc/nixos/overlays"
    "nixos-config=/etc/nixos/configuration.nix"
    "nixos-hardware=/etc/nixos/pkgs/nixos-hardware"
    "home-manager=/etc/nixos/pkgs/home-manager"
    "mozilla=/etc/nixos/pkgs/mozilla"
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = map (n: import (path + ("/" + n))) (builtins.filter (n:
  builtins.match ".*\\.nix" n != null || builtins.pathExists
  (path + ("/" + n + "/default.nix"))) (lib.attrNames content));

  nix = {
    gc.automatic = true;
    gc.options = "--delete-older-than 7d";

    # extraOptions = "post-build-hook = /etc/nixos/hooks/upload-to-cachix.sh";
    # extraOptions = "post-build-hook = ${pkgs.writeShellScript "upload-to-cachix" "${pkgs.cachix}/bin/cachix push silence"}";
    # extraOptions = "post-build-hook = ${pkgs.writeShellScript "upload-to-cachix" upload-to-cachix}";

    # extraOptions = "post-build-hook = ${pkgs.writeShellScript "upload-to-cachix" ''
    #  export HOME=/root
    #  echo $OUT_PATHS | ${pkgs.cachix}/bin/cachix push silence --config /root/.config/cachix/cachix.dhall
    # ''}";

    trustedBinaryCaches = [
      "http://hydra.nixos.org"
      "http://cache.nixos.org"
      "https://silence.cachix.org"
      "https://nixfmt.cachix.org"
      "https://all-hies.cachix.org"
      "https://iohk.cachix.org"
      "https://ghcide-nix.cachix.org"
      "https://cache.dhall-lang.org"
      "https://dhall.cachix.org"
    ];

    binaryCachePublicKeys = [
      "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
      "silence.cachix.org-1:os5cpvGmIPGBs7iKjQhD/S+pRS6fTOdSC6BxUi7/P1w="
    ];
  };
}
