{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # emacsGit
    (emacs.override { withXwidgets = true; })
    cask
  ];
}
