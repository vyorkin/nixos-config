{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bundix
  ];
}
