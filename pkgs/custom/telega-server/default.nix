{ pkgs, stdenv, tdlib }:

stdenv.mkDerivation rec {
  version = "2019-07-10";
  name = "telega-server-${version}";

  src = pkgs.fetchFromGitHub {
    owner = "zevlg";
    repo = "telega.el";
    rev = "537a9a6fb93d09b7dfa6e44aa5612a16ca816b98";
    sha256 = "0iadsr4wl4cj69szxlwfvnspjqyq6q0appc5h0xjfmqnijn1gspg";
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
