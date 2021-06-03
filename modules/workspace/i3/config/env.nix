{ pkgs, lib, config, ... }:
let
  theme = config.themes.colors;
  apps = config.defaultApps;
in {
  inherit apps theme;

  browser1 = apps.browser.cmd;
  browser2 = "${pkgs.google-chrome}/bin/google-chrome-stable";
  browser3 = "${pkgs.tor-browser}/bin/tor-browser";
  browser4 = "${pkgs.qutebrowser}/bin/qutebrowser";
  term1 = apps.term.cmd;
  term2 = "${pkgs.kitty}/bin/kitty";

  mod = "Mod4";
  hyper = "Mod3";
  alt = "Mod1";

  step1 = "1";
  step2 = "10";
}
