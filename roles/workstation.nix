{ pkgs, ... }:

{
  imports = [
    ../cfgs/bluetooth.nix
    ../cfgs/logitech.nix
    ../cfgs/web-browsers.nix
    ../cfgs/media.nix
    ../cfgs/mail.nix
    ../cfgs/db.nix
    ../cfgs/db-clients.nix
    ../cfgs/fonts.nix
    ../cfgs/vpn.nix
    ../cfgs/terminal.nix
    ../cfgs/monitoring.nix
    ../cfgs/emulators.nix
    ../cfgs/json.nix
    ../cfgs/github-clients.nix
  # ../cfgs/streaming.nix
    ../cfgs/security.nix
    ../cfgs/messaging.nix
    ../cfgs/haskell.nix
    ../cfgs/ocaml.nix
    ../cfgs/purescript.nix
    ../cfgs/rust.nix
    ../cfgs/python.nix
    ../cfgs/ruby.nix
    ../cfgs/clojure.nix
    ../cfgs/js.nix
    ../cfgs/automation.nix
    ../cfgs/development.nix
    ../cfgs/opengl.nix
    ../cfgs/sdl.nix
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
  # ../cfgs/tex.nix
    ../cfgs/proof-assisants.nix
    ../cfgs/scraping.nix
    ../cfgs/docker.nix
    ../cfgs/wm.nix
    ../cfgs/forensics.nix
    ../cfgs/dropbox.nix
  # ../cfgs/avr.nix
  ];

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    pasystray
    pavucontrol
  ];

  hardware.bluetooth.enable = true;

  boot.plymouth.enable = true;

  services = {
    locate.enable = true;
    mpd.enable = true;
    chrony.enable = true;
    psd = {
      enable = true;
      resyncTimer = "30min";
    };
    openssh = {
      enable = true;
      forwardX11 = true;
    };
    upower.enable = true;

    redshift = {
      enable = true;
      latitude = "55.751244";
      longitude = "37.618423";
      temperature.day = 5500;
      temperature.night = 3700;
    };
  };

  security.sudo.wheelNeedsPassword = false;
  security.polkit.extraConfig = ''
    /* Allow users in wheel group to manage systemd units without authentication */
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.systemd1.manage-units" &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  powerManagement = {
    enable = true;
    powerDownCommands = ''
    '';
    resumeCommands = ''
      ${pkgs.systemd}/bin/systemctl try-restart sshuttle.service
    '';

    # TODO: try to enable later, see https://bbs.archlinux.org/viewtopic.php?id=244225
    powertop.enable = false;
  };

  system.autoUpgrade.enable = true;
}
