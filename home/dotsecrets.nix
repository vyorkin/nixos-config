{ pkgs, ... }:

{
  home-manager.users.root = {
    home.file = {
      "cachix.dhall" = {
        source = ./dotsecrets/cachix.dhall;
        target = ".config/cachix/cachix.dhall";
      };
    };
  };

  home-manager.users.vyorkin = {
    home.file = {
      ".authinfo" = { source = ./dotsecrets/authinfo; };
      ".secret_tokens" = { source = ./dotsecrets/secret_tokens; };
      ".netrc" = { source = ./dotsecrets/netrc; };
      ".offlineimaprc" = { source = ./dotsecrets/offlineimaprc; };
      ".goobookrc" = { source = ./dotsecrets/goobookrc; };
      ".goobook_auth.json" = { source = ./dotsecrets/goobook_auth.json; };
      ".bumblebee-status.conf" = { source = ./dotsecrets/bumblebee-status.conf; };

      "cachix.dhall" = {
        source = ./dotsecrets/cachix.dhall;
        target = ".config/cachix/cachix.dhall";
      };

      "secrets" = {
        source = ./dotsecrets/emacs;
        target = ".emacs.d/secrets";
        recursive = true;
      };
    };
  };
}
