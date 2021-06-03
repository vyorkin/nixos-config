{ stdenv, fetchgit, python3 }:

let version = "1.7.2";
in stdenv.mkDerivation {
  name = "bumblebee-status-${version}";
  inherit version;
  src = fetchgit {
    rev = "4db9c714bb2db466cce8c514183473b2e9dabfb8";
    url = "https://github.com/tobi-wan-kenobi/bumblebee-status.git";
    sha256 = "10y6kgg7azdwcxsv5l1blzdi5sfh1vk2mrz65l6jm2723m15704p";
  };
  buildInputs = [(python3.withPackages
  (ps: with ps; [ i3ipc requests taskw netifaces psutil ]))];
  unpackPhase = ":";
  installPhase = ''
    install -d $out/opt/bumblebee-status
    cp -rp $src/* $out/opt/bumblebee-status
    install -d $out/bin
    ln -s $out/opt/bumblebee-status/bumblebee-status $out/bin/bumblebee-status
  '';
  meta = { };
}
