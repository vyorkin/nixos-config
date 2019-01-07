{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    wget
    httpie
    http-prompt
    httplab
    wuzz
    insomnia
  ];
}
