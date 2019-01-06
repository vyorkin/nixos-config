{ pkgs, ... }:

{
  imports = [
    <nixos-hardware/lenovo/thinkpad/x1/6th-gen>
    ../hardware-configuration.nix
    ../presets/common.nix
    ../presets/x11.nix
    ../presets/workstation.nix
    ../cfg/db.nix
    ../cfg/network-scanners.nix
    ../cfg/web-browsers.nix
    ../cfg/encryption.nix
    ../cfg/json.nix
    ../cfg/instant-messengers.nix
    ../cfg/haskell.nix
    ../cfg/rust.nix
    ../cfg/ruby.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "silence";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";
}
