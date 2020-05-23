{ pkgs, stdenv, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  name = "neovim-gtk-unstable-${version}";
  version = "master";

  src = builtins.fetchGit {
    url = "https://github.com/daa84/neovim-gtk.git";
    rev = "0af8952171c5375a4435cf3790e08c3b9ee29e8d";
  };

  cargoSha256 = "CUpCPPOqQQfa1fkdC8BnUp/Et4KICNed4l6V4ol7hGY=";

  buildInputs = [ pkgs.gtk3 pkgs.gnome3.vte pkgs.wrapGAppsHook ];

  meta = with stdenv.lib; {
    description = "GTK+ UI for Neovim";
    homepage = https://github.com/daa84/neovim-gtk;
    license = with licenses; [ gpl3 ];
  };
}
