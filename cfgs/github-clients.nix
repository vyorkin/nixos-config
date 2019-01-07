{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gist
  ];
}
