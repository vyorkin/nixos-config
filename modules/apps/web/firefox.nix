{ config, pkgs, lib, ... }:

let
  thm = pkgs.my.thmHash;
  fonts = config.themes.fonts;
in {
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    MOZ_DBUS_REMOTE = "1";
  };

  home-manager.users.vyorkin = {
    programs.browserpass = {
      enable = true;
      browsers = [ "firefox" ];
    };

    programs.firefox = {
      enable = true;

      profiles.default = {
        id = 0;

        userChrome = ''
          toolbar#nav-bar, nav-bar-customization-target {
            background: ${thm.base00} !important;
          }
        '';

        settings = {
          "extensions.autoDisableScopes" = 0;

          "browser.search.defaultenginename" = "Google";
          "browser.search.selectedEngine" = "Google";
          "browser.urlbar.placeholderName" = "Google";
          "browser.search.region" = "US";

          "browser.uidensity" = 1;
          "browser.search.openintab" = true;
          "xpinstall.signatures.required" = false;

          "font.name.monospace.x-western" = "${fonts.mono.family}";
          "font.name.sans-serif.x-western" = "${fonts.main.family}";
          "font.name.serif.x-western" = "${fonts.serif.family}";
        };
      };
    };
  };
}
