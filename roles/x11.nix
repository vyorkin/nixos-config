{ config, pkgs, ... }:

{
  imports = [
    ../cfgs/x11.nix
  ];

  services.compton = {
    enable = true;
  };

  services.xserver = {
    enable = true;

    layout = "us,ru";
    xkbModel = "pc105";
    xkbVariant = "qwerty";
    xkbOptions = "grp:alt_shift_toggle, grp:alt_space_toggle, grp_led:caps, caps:ctrl_modifier";

    libinput = {
      enable = true;
      tapping = false;
      clickMethod = "clickfinger";
      disableWhileTyping = true;
      scrollMethod = "twofinger";
      naturalScrolling = true;
    };
  };

  programs.light.enable = true;
}
