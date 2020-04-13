{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dhex
    vscode

    jetbrains.idea-community
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.datagrip
    jetbrains.webstorm
    jetbrains.ruby-mine
  ];
}
