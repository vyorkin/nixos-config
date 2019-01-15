{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zlib
    zip
    unzip
    bzip2
    zstd
    unrar
  ];
}
