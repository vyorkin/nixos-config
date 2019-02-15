{ pkgs, ... }:

{
  imports = [
    <nixos-hardware/lenovo/thinkpad/x1/6th-gen>
    ../hardware-configuration.nix
    ../roles/common.nix
    ../roles/x11.nix
    ../cfgs/gtk.nix
    ../cfgs/qt.nix
    ../cfgs/i3.nix
  # ../cfgs/gnome.nix
    ../roles/workstation.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [ "quiet" ];
    consoleLogLevel = 0;
  };

  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;

  networking.hostName = "silence";

  time.timeZone = "Europe/Moscow";
}
