{
  services.xserver = {
    enable = true;

    # Symlink the X server configuration under /etc/X11/xorg.conf
    exportConfiguration = true;

    # Length of time in milliseconds that a key must be
    # depressed before autorepeat starts
    autoRepeatDelay = 200;

    # Length of time in milliseconds that should elapse between
    # autorepeat-generated keystrokes
    autoRepeatInterval = 40;

    # Setup keyboard layout
    layout = "us,ru";
    xkbModel = "pc105";
    xkbVariant = "qwerty";

    # - Use Ctrl+Shift to switch between layouts
    # - Toggle led indicator on a CapsLock when current locale is RU
    # - Maps Ctrl to CapsLock
    xkbOptions = "grp:ctrl_shift_toggle, grp_led:caps, caps:ctrl_modifier";
  };
}
