{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      skype
      slack
      discord
      zoom-us
      tdesktop
      gitter
      gomuks
      # nheko
    ];
  };
}
