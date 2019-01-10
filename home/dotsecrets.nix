{ pkgs, ... }:

{
  home.file = {
    ".authinfo" = { source = ./dotsecrets/authinfo; };
    ".netrc" = { source = ./dotsecrets/netrc; };
    ".offlineimaprc" = { source = ./dotsecrets/offlineimaprc; };
    ".goobookrc" = { source = ./dotsecrets/goobookrc; };
    ".goobook_auth.json" = { source = ./dotsecrets/goobook_auth.json; };
  };
}
