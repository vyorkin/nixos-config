{ config, pkgs, ... }:

let
  authorizedKeys = import ./authorized-keys.nix;
  vyorkin = import ./vyorkin.nix { inherit authorizedKeys; };
in {
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      root.openssh.authorizedKeys.keys = authorizedKeys;
      vyorkin = vyorkin;
    };
  };

  nix.trustedUsers = [ "root" "vyorkin" ];
}
