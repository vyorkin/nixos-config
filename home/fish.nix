{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.broot.enableFishIntegration = true;
  };
}
