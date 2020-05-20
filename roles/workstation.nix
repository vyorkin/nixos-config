{ pkgs, config, ... }:


let angular_plymouth_theme = pkgs.callPackage ../pkgs/custom/plymouth-theme { };
in
{
  imports = [
    ../cfgs/x11
    ../cfgs/gtk.nix
    ../cfgs/qt.nix
    ../cfgs/i3.nix
    ../cfgs/pulseaudio.nix
    ../cfgs/bluetooth.nix
    ../cfgs/logitech.nix
    ../cfgs/web-browsers.nix
    ../cfgs/media.nix
    ../cfgs/mail.nix
    ../cfgs/fonts.nix
    ../cfgs/vpn.nix
    # ../cfgs/wireguard.nix
    ../cfgs/vnc.nix
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
    ../cfgs/documentation.nix
    ../cfgs/office.nix
    ../cfgs/file-managers.nix
    ../cfgs/code-editors.nix
    ../cfgs/remote-control.nix
    ../cfgs/devops.nix
    ../cfgs/network-scanners.nix
    ../cfgs/torrents.nix
    ../cfgs/blogging.nix
    ../cfgs/trading.nix
    ../cfgs/management.nix
    ../cfgs/text.nix
    ../cfgs/spell.nix
    ../cfgs/tex.nix
    ../cfgs/scraping.nix
    ../cfgs/docker.nix
    ../cfgs/kubernetes.nix
    ../cfgs/forensics.nix
    ../cfgs/dropbox.nix
    ../cfgs/games.nix
    ../cfgs/electronics.nix
    ../cfgs/db
    ../cfgs/development

    # Takes too much time to compile the VirtualBox
    # ../cfgs/wm.nix
  ];

  sound.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # environment = {
  #   sessionVariables = {
  #     CACHIX_SIGNING_KEY = config.secrets.cachix_signing_key;
  #   };
  # };

  boot.loader.timeout = 0;

  # Enable Plymouth boot splash screen
  boot.plymouth = {
    enable = true;
    theme = "angular";
    themePackages = with pkgs; [ angular_plymouth_theme ];
  };

  systemd.coredump.enable = true;
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  services = {
    locate.enable = true;

    # Synchronise time using chrony
    chrony.enable = true;

    openssh = {
      enable = true;
      forwardX11 = true;
    };
  };

  networking.firewall = {
    allowPing = false;
    allowedTCPPorts = [
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

      # vnc
      5900

      # postgresql:
      # 5432
    ];
  };

  security.sudo.wheelNeedsPassword = false;
}
