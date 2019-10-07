{ pkgs, ... }:

{
  imports = [
    ../cfgs/bluetooth.nix
    ../cfgs/logitech.nix
    ../cfgs/web-browsers.nix
    ../cfgs/media.nix
    ../cfgs/mail.nix
    ../cfgs/fonts.nix
    ../cfgs/vpn.nix
    ../cfgs/terminal.nix
    ../cfgs/monitoring.nix
    ../cfgs/emulators.nix
    ../cfgs/json.nix
    ../cfgs/github-clients.nix
    ../cfgs/streaming.nix
    ../cfgs/security.nix
    ../cfgs/messaging.nix
    ../cfgs/automation.nix
    ../cfgs/opengl.nix
    ../cfgs/sdl.nix
    ../cfgs/hardware.nix
    ../cfgs/documentation.nix
    ../cfgs/office.nix
    ../cfgs/file-managers.nix
    ../cfgs/code-editors.nix
    ../cfgs/remote-control.nix
    ../cfgs/devops.nix
    ../cfgs/network-scanners.nix
    ../cfgs/torrents.nix
    ../cfgs/blogging.nix
    ../cfgs/management.nix
    ../cfgs/text.nix
    ../cfgs/spell.nix
    ../cfgs/tex.nix
    ../cfgs/scraping.nix
    ../cfgs/docker.nix
    ../cfgs/forensics.nix
    ../cfgs/dropbox.nix
    ../cfgs/games.nix
    # ../cfgs/avr.nix
    ../cfgs/db
    ../cfgs/development

    # Takes too much time to compile the VirtualBox
    # ../cfgs/wm.nix
  ];

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  environment.systemPackages = with pkgs; [ pasystray pavucontrol ];

  hardware.bluetooth = {
    enable = true;
    extraConfig = "
      [General]
      Enable=Source,Sink,Media,Socket
    ";
  };

  # Enable Plymouth boot splash screen
  boot.plymouth.enable = true;

  services = {
    locate.enable = true;

    # Synchronise time using chrony
    chrony.enable = true;

    openssh = {
      enable = true;
      forwardX11 = true;
    };

    # Conflicts with xrandr-invert-colors
    # see: https://github.com/zoltanp/xrandr-invert-colors#after-a-short-time-the-colors-are-reverted-to-original-ones-there-is-no-error-message
    # (I use xflux instead)
    redshift = {
      enable = false;
      temperature.day = 5500;
      temperature.night = 3700;
    };
  };

  location = {
    latitude = "55.751244";
    longitude = "37.618423";
  };

  networking.firewall.allowedTCPPorts = [
    # ssh:
    22

    # http:
    80
    8080
    8081
    8082
    4000
    4001
    3000
    3001
    3002
    3003

    # postgresql:
    # 5432
  ];

  security.sudo.wheelNeedsPassword = false;

  nixpkgs.config.allowBroken = true;
  system.autoUpgrade.enable = true;
}
