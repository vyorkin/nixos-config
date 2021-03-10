{ pkgs, inputs, ... }:
{
  home-manager.users.vyorkin = {
    programs.emacs = {
      enable = true;
      package = inputs.emacs-overlay.emacsGit;
    };

    home.packages = [
      (pkgs.makeDesktopItem {
        terminal = "false";
        type = "Application";
        name = "emacsclient";
        genericName = "Text editor";
        desktopName = "Emacs client";
        mimeType = "text/plain";
        exec = "emacsclient -c %F";
        categories = "Development;TextEditor;Utility;";
        icon = "emacs";
      })
      pkgs.clang
    ];

    services.emacs.enable = true;

    systemd.user.services.emacs.Service.Environment =
      "PATH=/run/current-system/sw/bin:/etc/profiles/per-user/vyorkin/bin";
  };
}
