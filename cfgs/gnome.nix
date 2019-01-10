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

    gnome3.dconf
    gnome3.glib_networking

    gnome-mpv

    lxappearance-gtk3
    numix-gtk-theme
    numix-icon-theme
    numix-cursor-theme
  ];

  security.pam.services.gdm.enableGnomeKeyring = true;

  services = {
    xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome3.enable = true;
    };

    gnome3.chrome-gnome-shell.enable = true;
  };
}
