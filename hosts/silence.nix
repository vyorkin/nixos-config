{ pkgs, ... }:

{
  imports = [
    ../setup.nix
    ../hardware/silence
    <home-manager/nixos>
    ../modules
    ../roles/common.nix
    ../cfgs/x11
    ../cfgs/gtk.nix
    ../cfgs/qt.nix
    ../cfgs/i3.nix
    ../roles/workstation.nix
    ../cfgs/users
    ../home
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = ["quiet"];
    consoleLogLevel = 0;
  };

  hardware.cpu.intel.updateMicrocode = true;
  # hardware.enableAllFirmware = true;

  networking.hostName = "silence";

  time.timeZone = "Europe/Moscow";
}
