{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dropbox
    dropbox-cli
  ];
}
