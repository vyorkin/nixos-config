{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      obs-studio
      obs-wlrobs
    ];
  };
}
