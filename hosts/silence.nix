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
    ../cfgs/fonts.nix
    ../cfgs/vpn.nix
    ../cfgs/db.nix
    ../cfgs/db-clients.nix
    ../cfgs/terminal.nix
    ../cfgs/monitoring.nix
    ../cfgs/web-browsers.nix
    ../cfgs/media.nix
    ../cfgs/emulators.nix
    ../cfgs/mail.nix
    ../cfgs/json.nix
    ../cfgs/github-clients.nix
  # ../cfgs/streaming.nix
    ../cfgs/security.nix
    ../cfgs/messaging.nix
    ../cfgs/haskell.nix
    ../cfgs/purescript.nix
    ../cfgs/rust.nix
    ../cfgs/python.nix
    ../cfgs/ruby.nix
    ../cfgs/clojure.nix
    ../cfgs/js.nix
    ../cfgs/automation.nix
    ../cfgs/development.nix
    ../cfgs/hardware.nix
    ../cfgs/documentation.nix
    ../cfgs/file-managers.nix
    ../cfgs/code-editors.nix
    ../cfgs/remote-control.nix
    ../cfgs/devops.nix
    ../cfgs/network-scanners.nix
    ../cfgs/torrents.nix
    ../cfgs/text.nix
    ../cfgs/aspell.nix
    ../cfgs/tex.nix
    ../cfgs/proof-assisants.nix
    ../cfgs/scraping.nix
    ../cfgs/docker.nix
    ../cfgs/wm.nix
    ../cfgs/forensics.nix
  # ../cfgs/avr.nix
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
