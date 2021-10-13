{ pkgs, inputs, ... }:

{
  services = {
    # Enable ACPI deamon. When an event occurs, it executes
    # programs to handle the event. These events are triggered
    # by certain actions, such as:
    # - Pressing special keys, including the Power/Sleep/Suspend button
    # - Closing a notebook lid
    # - (Un)Plugging an AC power adapter from a notebook
    # - (Un)Plugging phone jack etc
    acpid.enable = true;

    # Enable a deamon that allows updating some devices
    # firmware, including UEFI for several machines
    fwupd.enable = true;

    # Enable programs to publish and discover services and
    # hosts running on a local network. For example, a user can
    # plug a computer into a network and have Avahi
    # automatically advertise the network services running on
    # its machine, facilitating user access to those services
    avahi.enable = true;

    # Many GTK-based file managers like Nautilus, Thunar, and PCManFM can browse samba
    # shares thanks to GVFS. GVFS is a dbus daemon which must be running for this to work.
    # If you use Gnome, you have nothing to do as the module already enables it for you,
    # but in less full-featured desktop environments, some further configuration options are needed.
    gvfs.enable = true;

    # Basically EarlyOOM prevents freezes due to running out of memory.
    # Checks the amount of available memory and free swap up to
    # 10 times a second (less often if there is a lot of free memory).
    # By default if both are below min values, it will
    # kill the largest process (highest oom_score)
    earlyoom = {
      enable = true;
      # Minimum of availabe memory (in percent). If the free
      # memory falls below this threshold and the analog is true
      # for freeSwapThreshold the killing begins
      freeMemThreshold = 5;
      # Minimum of availabe swap space (in percent). If the
      # available swap space falls below this threshold and the
      # analog is true for freeMemThreshold the killing begins
      freeSwapThreshold = 100;
    };

    # Enable printer support
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
    };

    # Enable scanner support
    # Docs: https://nixos.wiki/wiki/Scanners
    saned.enable = true;

    # systemd-logind settings
    logind = {
      # What to be done when the laptop lid is closed
      lidSwitch = "hibernate";
      # What to be done when the laptop lid is closed and
      # the system is on external power
      lidSwitchExternalPower = "ignore";
      # Pressing power button means hibernate
      extraConfig = "HandlePowerKey=hibernate";
    };

    interception-tools = { enable = true; };
  };

  services.openvpn = {
    servers = {
      home = {
        config = "config ${inputs.secrets}/vpn/home.ovpn";
        autoStart = false;
        updateResolvConf = true;
      };

      work = {
        config = "config ${inputs.secrets}/vpn/work.ovpn";
        autoStart = false;
        updateResolvConf = true;
      };
    };
  };
}
