{
  system = {
    # Periodically upgrade NixOS to the latest version.
    # systemd timer will run nixos-rebuild switch --upgrade once a day
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      dates = "8:00";
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "20.09";
  };
}
