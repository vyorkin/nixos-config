{ pkgs, ... }:

{
  # Enable all the firmware with a license allowing redistribution
  # (i.e. free firmware and firmware-linux-nonfree)
  hardware.enableRedistributableFirmware = true;

  # Use the latest Linux kernel packages
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
