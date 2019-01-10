{ stdenv, fetchgit, python3 }:
let
  version = "1.7.0";
in stdenv.mkDerivation {
  name = "bumblebee-status-${version}";
  inherit version;
  src = fetchgit {
    rev = "7152bb17f2536edd807b143517073205369d51f7";
    url = "https://github.com/tobi-wan-kenobi/bumblebee-status.git";
    sha256 = "11vv4s62zmmnaygg09j1sas79qjiigajym7xs3x4ghp0ahkacsm7";
  };
  buildInputs = [(python3.withPackages (
  ps: with ps; [i3ipc requests taskw netifaces psutil]
  ))];
  unpackPhase = ":";
  installPhase = ''
    install -d $out/opt/bumblebee-status
    cp -rp $src/* $out/opt/bumblebee-status
    install -d $out/bin
    ln -s $out/opt/bumblebee-status/bumblebee-status $out/bin/bumblebee-status
  '';
  meta = {};
}
