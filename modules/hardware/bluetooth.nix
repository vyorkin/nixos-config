{ pkgs, ... }:

{
  # Enable support for Bluetooth devices
  # Docs: https://nixos.wiki/wiki/Bluetooth
  hardware.bluetooth = {
    enable = true;

    # Enable all bluez plugins
    package = pkgs.bluezFull;

    # Modern headsets will generally try to connect using the A2DP profile.
    # To enable this we need to add the following lines:
    settings = { General = { Enable = "Source,Sink,Media,Socket"; }; };
  };

  services.blueman.enable = true;
}
