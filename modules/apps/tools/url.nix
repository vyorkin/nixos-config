{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    urlscan
    urlview
    urlwatch
  ];
}
