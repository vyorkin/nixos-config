{ lib, ... }:

{
  # Set the time zone
  time.timeZone = "Europe/Moscow";

  console = {
    # Set terminal font
    font = "cyr-sun16";
    # Use Ctrl+Shift to switch between layouts
    keyMap = "ruwin_ct_sh-UTF-8";
  };

  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us,ru";
    XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle,caps:ctrl_modifier,grp_led:caps";
    LANG = lib.mkForce "en_US.UTF-8";
  };

  home-manager.users.vyorkin = {
    home.language = let
      en = "en_US.UTF-8";
      ru = "ru_RU.UTF-8";
    in {
      address = ru;
      monetary = ru;
      paper = ru;
      time = en;
      base = en;
    };
  };
}
