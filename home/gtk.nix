{ pkgs, ... }:

with import ../const.nix;
{
  home-manager.users.vyorkin = {
    gtk = {
      enable = true;

      theme = {
        name = "Arc-Dark";
        package = pkgs.arc-theme;
      };

      # theme = {
      #   name = "Paper";
      #   package = pkgs.paper-gtk-theme;
      # };

      # theme = {
      #   name = "Adapta";
      #   package = pkgs.adapta-gtk-theme;
      # };

      iconTheme = {
        name = "Paper";
        package = pkgs.paper-icon-theme;
      };

      # iconTheme = {
      #   name = "Papirus Light";
      #   package = pkgs.papirus-icon-theme;
      # };
    };
  };
}
