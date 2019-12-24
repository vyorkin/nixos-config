{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    you-get
    youtube-dl
    go-pup
  ];
}
