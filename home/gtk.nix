{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    gtk = {
      enable = true;

      gtk2.extraConfig = ''
        gtk-cursor-theme-name = capitaine-cursors;
      '';
      gtk3.extraConfig = { gtk-cursor-theme-name = "capitaine-cursors"; };

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
