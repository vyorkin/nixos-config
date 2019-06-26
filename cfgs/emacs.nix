{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (emacs.override { withXwidgets = true; })
    cask
  ];
}
