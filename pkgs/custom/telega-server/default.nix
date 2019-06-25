{ pkgs, stdenv }:

let tdlib = pkgs.callPackage ../tdlib { };
in stdenv.mkDerivation rec {
  name = "telega-server";

  src = pkgs.fetchFromGitHub {
    owner = "zevlg";
    repo = "telega.el";
    rev = "537a9a6fb93d09b7dfa6e44aa5612a16ca816b98";
    sha256 = "1kcipwn56vax1ylz5qvr5hip1gy7q9bk1v4ywjvi9pz7hg78xsh9";
  };

  buildInputs = [tdlib];

  buildPhase = ''
    cd server && make
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp telega-server $out/bin
  '';

  meta = with stdenv.lib; {
    description = "Telega.el server part";
    homepage = "https://github.com/zevlg/telega.el";
    license = [pkgs.stdenv.lib.licenses.gpl3];
    platforms = with pkgs.stdenv.lib.platforms; linux;
  };
}
