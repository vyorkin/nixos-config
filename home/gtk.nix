{ pkgs, ... }:

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
    };
  };
}
