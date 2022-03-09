{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      skypeforlinux
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
