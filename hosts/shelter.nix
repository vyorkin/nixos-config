{ pkgs, ... }:

{
  imports = [
    ../setup.nix
    ../hardware/shelter
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
      grub.enable = true;
      grub.version = 2;
      grub.device = "/dev/sda"; # or "nodev" for efi only
    };

    kernelParams = ["quiet"];
    consoleLogLevel = 0;
  };

  networking.hostName = "shelter";

  time.timeZone = "Europe/Moscow";
}
