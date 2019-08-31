{ pkgs, stdenv }:

let tdlib = pkgs.callPackage ../../nixpkgs/pkgs/development/libraries/tdlib { };
in stdenv.mkDerivation rec {
  version = "99a91aaff7fe36570f9af137a5f9904e808978b9";
  pname = "telega-server";

  src = pkgs.fetchFromGitHub {
    owner = "zevlg";
    repo = "telega.el";
    rev = version;
    sha256 = "19vr0m8kgjqkl5x89wy2gbpy6qg5b6ack7b6cnrgfk70187jab4g";
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
