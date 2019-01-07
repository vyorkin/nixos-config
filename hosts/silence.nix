{ pkgs, ... }:

{
  imports = [
    <nixos-hardware/lenovo/thinkpad/x1/6th-gen>
    ../hardware-configuration.nix
    ../roles/common.nix
    ../roles/x11.nix
    ../roles/workstation.nix
    ../cfgs/db.nix
    ../cfgs/db-clients.nix
    ../cfgs/network-scanners.nix
    ../cfgs/web-browsers.nix
    ../cfgs/json.nix
    ../cfgs/github-clients.nix
    ../cfgs/instant-messengers.nix
    ../cfgs/haskell.nix
    ../cfgs/rust.nix
    ../cfgs/ruby.nix
    ../cfgs/clojure.nix
    ../cfgs/js.nix
    ../cfgs/automation.nix
    ../cfgs/development.nix
    ../cfgs/documentation.nix
    ../cfgs/devops.nix
    ../cfgs/forensics.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "silence";

  time.timeZone = "Europe/Moscow";
}
