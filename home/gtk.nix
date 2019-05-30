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
        name = "Paper";
        package = pkgs.paper-icon-theme;
      };
    };
  };
}
