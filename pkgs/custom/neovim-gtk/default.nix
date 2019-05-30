{ pkgs, stdenv, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  name = "neovim-gtk-unstable-${version}";
  version = "master";

  src = fetchFromGitHub {
    owner = "daa84";
    repo = "neovim-gtk";
    rev = "dfb97c822337bb83e96c441114334beece471352";
    sha256 = "1x6bs5i2kwy3zwmpd3qbrkfgfb4fqdqfkqmx1579vg1j4vyzpywb";
  };

  cargoSha256 = "1glin444bkds5vx98z6kil9g71gc1lv6j320iwp461hdq11cnzz9";

  buildInputs = [ pkgs.gtk3 pkgs.gnome3.vte pkgs.wrapGAppsHook ];

  meta = with stdenv.lib; {
    description = "GTK+ UI for Neovim";
    homepage = https://github.com/daa84/neovim-gtk;
    license = with licenses; [ gpl3 ];
  };
}
