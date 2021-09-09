{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    asciinema
  ];
}
