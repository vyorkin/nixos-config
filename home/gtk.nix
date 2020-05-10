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

      iconTheme = {
        name = "Papirus Dark";
        package = pkgs.papirus-icon-theme;
      };

      font = {
        package = pkgs.roboto;
        name = "Roboto 11";
      };

      # theme = {
      #   name = "Paper";
      #   package = pkgs.paper-gtk-theme;
      # };

      # theme = {
      #   name = "Adapta";
      #   package = pkgs.adapta-gtk-theme;
      # };

      # iconTheme = {
      #   name = "Paper";
      #   package = pkgs.paper-icon-theme;
      # };
    };
  };
}
