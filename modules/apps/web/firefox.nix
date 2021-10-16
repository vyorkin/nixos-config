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
          @-moz-document url("about:newtab") {
            * { background-color: ${thm.base00}  !important; }
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

          "font.name.monospace.x-western" = "${fonts.mono.family}";
          "font.name.sans-serif.x-western" = "${fonts.main.family}";
          "font.name.serif.x-western" = "${fonts.serif.family}";

          "pdfjs.disabled" = true;
          "media.videocontrols.picture-in-picture.enabled" = true;

          "widget.non-native-theme.enabled" = false;

          "browser.newtabpage.enabled" = false;
          "browser.startup.homepage" = "about:blank";

          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;

          "experiments.activeExperiment" = false;
          "experiments.enabled" = false;
          "experiments.supported" = false;
          "network.allow-experiments" = false;
        };
      };
    };
  };
}
