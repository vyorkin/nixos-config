{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (emacsGit.override { withXwidgets = true; })
    cask
  ];
}
