{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    corgi
  ];
}
