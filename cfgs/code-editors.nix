{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # dhex
    # kakoune

    # vscode

    jetbrains.idea-community
    # jetbrains.idea-ultimate
    # jetbrains.clion
    # jetbrains.datagrip
    # jetbrains.webstorm
    # jetbrains.ruby-mine
  ];
}
