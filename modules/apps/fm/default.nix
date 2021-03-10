{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ranger
  ];

  home-manager.users.vyorkin = {
    programs.broot = {
      enable = true;
    };
  };
}
