{ pkgs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    pasystray
    pavucontrol
  ];

  hardware.bluetooth.enable = true;

  boot.plymouth.enable = true;

  services = {
    locate.enable = true;
    irqbalance.enable = true;
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
    tlp.enable = true;
    acpid.enable = true;
    upower.enable = true;

    redshift = {
      enable = true;
      latitude = "55.751244";
      longitude = "55.751244";
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
      ${pkgs.systemd}/bin/systemctl restart imapfilter.service
      ${pkgs.systemd}/bin/systemctl try-restart sshuttle.service
    '';
    powertop.enable = true;
  };

  system.autoUpgrade.enable = true;
}
