{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [ abiword gnumeric obsidian ];
  };
}
