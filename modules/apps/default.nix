{ pkgs, config, lib, ... }:
{
  options.apps = lib.mkOption {
    type = lib.types.attrs;
    description = "Preferred applications";
  };
  config = rec {
    apps = {
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
    };

    environment.sessionVariables = {
      EDITOR = config.apps.editor.cmd;
      VISUAL = config.apps.editor.cmd;
    };

    home-manager.users.vyorkin.xdg.mimeApps = {
      enable = true;
      apps =
        with config.apps;
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
