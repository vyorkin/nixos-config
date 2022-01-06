{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [ blender ];
  };
}
