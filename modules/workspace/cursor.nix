{ pkgs, lib, ... }: {

  environment.sessionVariables = {
    XCURSOR_PATH = lib.mkForce "/home/vyorkin/.icons";
    XCURSOR_SIZE = lib.mkForce "16";
  };

  home-manager.users.vyorkin = {
    home.pointerCursor = {
      package = pkgs.breeze-qt5;
      name = "Breeze";
      size = 16;
    };

    # home.file = {
    #   ".icons/default" = { source = "${pkgs.breeze-qt5}/share/icons/breeze_cursors"; };
    #   ".icons/Breeze" = { source = "${pkgs.breeze-qt5}/share/icons/breeze_cursors"; };
    # };
  };
}
