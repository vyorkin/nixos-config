{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode
    jetbrains.idea-community
  ];
}
