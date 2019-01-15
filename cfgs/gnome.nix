{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.gnome-shell
    gnome3.gnome-shell-extensions
    chrome-gnome-shell

    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    gnomeExtensions.remove-dropdown-arrows
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.icon-hider
    gnomeExtensions.nohotcorner
    gnomeExtensions.mediaplayer
  # gnomeExtensions.no-title-bar

    gnome3.dconf
    gnome3.glib_networking

    gnome-mpv
  ];

  # watch for: https://github.com/NixOS/nixpkgs/issues/21859
  security.pam.services.gdm.enableGnomeKeyring = true;

  services = {
    xserver = {
      desktopManager.gnome3.enable = true;
      displayManager.gdm = {
        enable = true;
      };
    };

    gnome3.chrome-gnome-shell.enable = true;
  };
}
