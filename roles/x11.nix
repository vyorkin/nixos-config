{ config, pkgs, ... }:

{
  imports = [
    ../cfgs/x11.nix
  ];

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
  };

  programs.light.enable = true;
}
