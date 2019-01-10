{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    teamviewer
  ];
}
