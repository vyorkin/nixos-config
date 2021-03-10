{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
  ];
}
