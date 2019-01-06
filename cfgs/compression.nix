{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zip
    unzip
    zstd
  ];
}
