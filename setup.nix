{ config, lib, options, modulesPath }:

let
  path = ./overlays;
  content = builtins.readDir path;
in {
  nix.nixPath = [
    "nixpkgs=/etc/nixos/pkgs/nixpkgs-channels"
    "nixpkgs-overlays=/etc/nixos/overlays"
    "nixos-config=/etc/nixos/configuration.nix"
    "nixos-hardware=/etc/nixos/pkgs/nixos-hardware"
    "home-manager=/etc/nixos/pkgs/home-manager"
    "mozilla=/etc/nixos/pkgs/mozilla"
  ];

  nixpkgs.overlays = map (n: import (path + ("/" + n)))
    (builtins.filter (n: builtins.match ".*\\.nix" n != null || builtins.pathExists (path + ("/" + n + "/default.nix")))
      (lib.attrNames content));

  nix.trustedBinaryCaches = [
    "http://hydra.nixos.org"
    "http://cache.nixos.org"
  ];
}
