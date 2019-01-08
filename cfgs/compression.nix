{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zip
    unzip
    zstd
    unrar
  ];
}
