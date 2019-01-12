{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zlib
    zip
    unzip
    zstd
    unrar
  ];
}
