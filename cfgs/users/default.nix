{ config, pkgs, ... }:

let
  authorizedKeys = import ./authorized-keys.nix;
  vyorkin = import ./vyorkin.nix { inherit authorizedKeys; };
in
  {
    users.defaultUserShell = pkgs.zsh;

    users.users.root.openssh.authorizedKeys.keys = authorizedKeys;
    users.users.vyorkin = vyorkin;

    nix.trustedUsers = [ "vyorkin" ];
  }
