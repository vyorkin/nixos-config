{ pkgs, stdenv }:

let tdlib = pkgs.callPackage ../../nixpkgs/pkgs/development/libraries/tdlib { };
in stdenv.mkDerivation rec {
  version = "0.4.0";
  pname = "telega-server";

  src = pkgs.fetchFromGitHub {
    owner = "zevlg";
    repo = "telega.el";
    rev = version;
    sha256 = "1a5fxix2zvs461vn6zn36qgpg65bl38gfb3ivr24wmxq1avja5s1";
  };

  buildInputs = [ tdlib ];

  preBuild = ''
    cd server
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp telega-server $out/bin
  '';

  meta = with stdenv.lib; {
    description = "Server for GNU Emacs telegram client (unofficial)";
    homepage = "https://github.com/zevlg/telega.el";
    license = [pkgs.stdenv.lib.licenses.gpl3];
    platforms = with pkgs.stdenv.lib.platforms; linux;
  };
}
