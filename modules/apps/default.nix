{ pkgs, config, lib, ... }:
{
  options.defaultApps = lib.mkOption {
    type = lib.types.attrs;
    description = "Preferred applications";
  };
  config = rec {
    defaultApps = {
      term = {
        cmd = "${pkgs.alacritty}/bin/alacritty";
        desktop = "alacritty";
      };
      editor = {
        cmd = "${config.home-manager.users.vyorkin.programs.emacs.finalPackage}/bin/emacsclient -c $@";
        desktop = "emacsclient";
      };
      browser = {
        cmd = "${pkgs.firefox-wayland}/bin/firefox";
        desktop = "firefox";
      };
      messenger = {
        cmd = "${pkgs.tdesktop}/bin/telegram-desktop";
        desktop = "telegram";
      };
    };

    environment.sessionVariables = {
      EDITOR = config.defaultApps.editor.cmd;
      VISUAL = config.defaultApps.editor.cmd;
    };

    home-manager.users.vyorkin.xdg.mimeApps = {
      enable = true;
      defaultApplications =
        with config.defaultApps;
        builtins.mapAttrs (name: value:
          if value ? desktop then [ "${value.desktop}.desktop" ] else value) {
            "text/html" = browser;

            "x-scheme-handler/http" = browser;
            "x-scheme-handler/https" = browser;
            "x-scheme-handler/about" = browser;
            "x-scheme-handler/unknown" = browser;

            # This actually makes Emacs an editor for everything... XDG is wierd
            "text/plain" = editor;
          };
    };
  };
}
