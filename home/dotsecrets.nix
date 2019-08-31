{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".authinfo" = { source = ./dotsecrets/authinfo; };
      ".secret_tokens" = { source = ./dotsecrets/secret_tokens; };
      ".netrc" = { source = ./dotsecrets/netrc; };
      ".offlineimaprc" = { source = ./dotsecrets/offlineimaprc; };
      ".goobookrc" = { source = ./dotsecrets/goobookrc; };
      ".goobook_auth.json" = { source = ./dotsecrets/goobook_auth.json; };
      ".bumblebee-status.conf" = { source = ./dotsecrets/bumblebee-status.conf; };

      "secrets" = {
        source = ./dotsecrets/emacs;
        target = ".emacs.d/secrets";
        recursive = true;
      };
    };
  };
}
