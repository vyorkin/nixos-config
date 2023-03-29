{ pkgs, ... }:

let
  authorizedKeys = import ./authorized-keys.nix;
  vyorkin = import ./vyorkin.nix { inherit authorizedKeys; };
in {
  users = {
    # Enable adding new user and groups to the system
    # with the ordinary useradd and groupadd commands
    mutableUsers = true;

    # defaultUserShell = pkgs.zsh;
    users = {
      root.openssh.authorizedKeys.keys = authorizedKeys;
      vyorkin = vyorkin;
    };
  };

  # A list of names of users that have additional rights when
  # connecting to the Nix daemon
  nix.settings.trusted-users = [ "root" "vyorkin" ];

  # Whether users of the wheel group must provide a
  # password to run commands as super user via sudo
  security.sudo.wheelNeedsPassword = false;
}
