{ pkgs, lib, ... }: {

  environment.sessionVariables = {
    XCURSOR_PATH = lib.mkForce "/home/vyorkin/.icons";
  };

  home-manager.users.vyorkin = {
    xsession.pointerCursor = {
      package = pkgs.breeze-qt5;
      name = "Breeze";
    };

    # home.file = {
    #   ".icons/default" = { source = "${pkgs.breeze-qt5}/share/icons/breeze_cursors"; };
    #   ".icons/Breeze" = { source = "${pkgs.breeze-qt5}/share/icons/breeze_cursors"; };
    # };
  };
}
