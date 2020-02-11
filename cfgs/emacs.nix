{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # emacsGit
    (emacs.override {
      inherit imagemagick;
      withXwidgets = true;
    })
    cask
  ];
}
