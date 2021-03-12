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
        settings = {
          "extensions.autoDisableScopes" = 0;

          "browser.search.defaultenginename" = "Google";
          "browser.search.selectedEngine" = "Google";
          "browser.urlbar.placeholderName" = "Google";
          "browser.search.region" = "US";

          "browser.uidensity" = 1;
          "browser.search.openintab" = true;
          "xpinstall.signatures.required" = false;

          "font.name.monospace.x-western" = "IBM Plex Mono";
          "font.name.sans-serif.x-western" = "IBM Plex Sans";
          "font.name.serif.x-western" = "IBM Plex Serif";

          "browser.display.use_document_fonts" = true;
          "pdfjs.disabled" = true;
          "media.videocontrols.picture-in-picture.enabled" = true;
        };
      };
    };
  };
}
