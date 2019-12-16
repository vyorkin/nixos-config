{ pkgs, ... }:

{
  sound.mediaKeys.enable = true;
  # I use Home Manager to manage X session

  services.xserver = {
    displayManager = {
      lightdm = {
        enable = false;
        autoLogin.user = "vyorkin";
      };

      sddm = {
        enable = false;
        autoLogin.user = "vyorkin";
      };

      gdm = {
        enable = true;
        autoSuspend = false;
        autoLogin.user = "vyorkin";
      };
    };
  };
}
