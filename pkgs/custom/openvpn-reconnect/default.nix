{ stdenv, fetchFromGitHub }:

let version = "0.1.0";
in stdenv.mkDerivation {
  name = "openvpn-reconnect-${version}";
  inherit version;
  src = fetchFromGitHub {
    "owner" = "crasm";
    "repo" = "openvpn-reconnect";
    "rev" = "a4464da59e69c53b2130eab011257d3ab7e4c040";
    "sha256" = "0x8xwk9wf59xccdr2xjmssgpk79rfjbvfgyhhcrn0ny01rmp71sj";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp openvpn-reconnect $out/bin
  '';
  meta = { };
}
