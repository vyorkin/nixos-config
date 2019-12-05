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
        enable = true;
        autoLogin.user = "vyorkin";
      };

      gdm = {
        enable = false;
        autoSuspend = false;
        autoLogin.user = "vyorkin";
      };
    };
  };
}
