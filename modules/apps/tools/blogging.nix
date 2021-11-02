{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hugo
  ];
}
