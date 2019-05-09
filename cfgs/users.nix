{ config, pkgs, users, ... }:

let
  authorizedKeys = import ./authorized-keys.nix;
in
  {
    users.defaultUserShell = pkgs.zsh;

    users.users.root.openssh.authorizedKeys.keys = authorizedKeys;
    users.users.vyorkin = {
      isNormalUser = true;
      uid = 1000;
      description = "Vasiliy Yorkin";
      home = "/home/vyorkin";
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "networkmanager"
        "input"
        "scanner"
        "lp"
        "dialout"
        "vboxusers"
        "wireshark"
        "docker"
        "adbusers"
        "render"
      ];
      createHome = true;
      initialPassword = "whatever";
      useDefaultShell = true;
      openssh.authorizedKeys.keys = authorizedKeys;
    };

    nix.trustedUsers = [ "vyorkin" ];
  }
