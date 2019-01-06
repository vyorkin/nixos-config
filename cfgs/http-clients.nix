{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    wget
    httpie
  ];
}
