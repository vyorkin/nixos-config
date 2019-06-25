{ pkgs, stdenv }:

stdenv.mkDerivation rec {
  version = "2019-06-25";
  name = "tdlib-${version}";

  src = pkgs.fetchFromGitHub {
    owner = "tdlib";
    repo = "td";
    rev = "21dee3b1d923f3fdacc711b46ad102b1d0d1439b";
    sha256 = "1ijyn14rjb87rqm39hg7md8ab33yiy8cgzw3p0m37scn58gabpp7";
  };

  buildInputs = [ pkgs.gperf pkgs.openssl pkgs.readline pkgs.zlib ];
  nativeBuildInputs = [pkgs.cmake];

  meta = with stdenv.lib; {
    description = "Cross-platform library for building Telegram clients";
    homepage = "https://core.telegram.org/tdlib/";
    license = [pkgs.stdenv.lib.licenses.boost];
    platforms = with pkgs.stdenv.lib.platforms; linux;
  };
}
