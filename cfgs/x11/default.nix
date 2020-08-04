{ config, pkgs, ... }:

{
  imports = [./packages.nix];

  services.compton = { enable = true; };

  services.xserver = {
    enable = true;

    # For recent ADM GPU's you most likely want to
    # keep either the defaults or "amdgpu" (both free)
    # videoDrivers = [ "amdgpu" ];

    # Use the Glamor module for 2D acceleration, if possible
    useGlamor = true;

    # Symlink the X server configuration under /etc/X11/xorg.conf
    exportConfiguration = true;

    autoRepeatDelay = 200;
    autoRepeatInterval = 40;

    layout = "us,ru";
    xkbModel = "pc105";
    xkbVariant = "qwerty";
    xkbOptions = "grp:alt_shift_toggle, grp:alt_space_toggle, grp_led:caps, caps:ctrl_modifier";

  };

  programs.light.enable = true;
}
