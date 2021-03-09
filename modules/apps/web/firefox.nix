{ config, pkgs, lib, ... }:

let
  theme = config.themes.colors;
in {
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    MOZ_DBUS_REMOTE = "1";
  };

  programs.browserpass.enable = true;

  home-manager.users.vyorkin = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-wayland;

      profiles.default = {
        id = 0;
        userChrome = ''
          #TabsToolbar {
            visibility: collapse;
          }
          toolbar#nav-bar, nav-bar-customization-target {
            background: ${theme.bg} !important;
          }
          @-moz-document url("about:newtab") {
            * { background-color: ${theme.bg}  !important; }
          }
        '';
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "extensions.autoDisableScopes" = 0;

          "browser.search.defaultenginename" = "Google";
          "browser.search.selectedEngine" = "Google";
          "browser.urlbar.placeholderName" = "Google";
          "browser.search.region" = "US";

          "browser.uidensity" = 1;
          "browser.search.openintab" = true;
          "xpinstall.signatures.required" = false;
          "extensions.update.enabled" = false;

          "font.name.monospace.x-western" = "IBM Plex Mono";
          "font.name.sans-serif.x-western" = "IBM Plex Sans";
          "font.name.serif.x-western" = "IBM Plex Serif";

          "browser.display.background_color" = theme.bg;
          "browser.display.foreground_color" = theme.fg;
          "browser.display.document_color_use" = 2;
          "browser.anchor_color" = theme.fg;
          "browser.visited_color" = theme.blue;
          "browser.display.use_document_fonts" = true;
          "pdfjs.disabled" = true;
          "media.videocontrols.picture-in-picture.enabled" = true;
        };
      };
    };
  };
}
