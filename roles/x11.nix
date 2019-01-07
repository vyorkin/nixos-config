{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us,ru,de";
    xkbModel = "pc105";
    xkbVariant = "qwerty";
    xkbOptions = "grp:toggle, grp_led:caps, caps:ctrl_modifier";

    libinput = {
      enable = true;
      tapping = false;
      clickMethod = "clickfinger";
      disableWhileTyping = true;
      scrollMethod = "twofinger";
      naturalScrolling = true;
    };

    displayManager.sddm.enable = true;
    desktopManager.gnome3.enable = true;
  };
}
