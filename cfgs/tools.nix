{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpi
    scrot
    flameshot
    aria2
    urlscan
    urlview
    urlwatch
    file
  ];
}
