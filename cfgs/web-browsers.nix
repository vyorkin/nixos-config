{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    shadowfox
  ];
}
