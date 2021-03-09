{ pkgs, ... }:

let
  authorizedKeys = import ./authorized-keys.nix;
  vyorkin = import ./vyorkin.nix { inherit authorizedKeys; };
in {
  users = {
    # Disable adding new user and groups to the system
    # with the ordinary useradd and groupadd commands
    mutableUsers = false;

    defaultUserShell = pkgs.zsh;
    users = {
      root.openssh.authorizedKeys.keys = authorizedKeys;
      vyorkin = vyorkin;
    };
  };

  nix.trustedUsers = [ "root" "vyorkin" ];

  # Whether users of the wheel group must provide a
  # password to run commands as super user via sudo
  security.sudo.wheelNeedsPassword = false;
}
