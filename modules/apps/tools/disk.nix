{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    duf
    ncdu
  ];
}
