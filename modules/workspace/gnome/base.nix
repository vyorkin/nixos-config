{
  # Enable a low-level configuration system and settings
  # management tool. Its main purpose is to provide a back end
  # to GSettings on platforms that don't already have
  # configuration storage systems. It is part of GNOME 3 and is
  # a replacement for GConf
  programs.dconf.enable = true;

  # Packages whose D-Bus configuration files should be included
  # in the configuration of the D-Bus system-wide or
  # session-wide message bus
  services.dbus.packages = with pkgs; [ gnome3.dconf ];
}
