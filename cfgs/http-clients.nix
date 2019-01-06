{ pkgs, ... }:

{
  home.packages = with pkgs; [
    curl
    wget
    httpie
  ];
}
