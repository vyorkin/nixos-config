{
  # Whether users of the wheel group must provide a
  # password to run commands as super user via sudo
  security = {
    sudo.wheelNeedsPassword = false;
  };

  # A list of names of users that have additional rights when
  # connecting to the Nix daemon
  nix.trustedUsers = [ "root" "vyorkin" ];
}
