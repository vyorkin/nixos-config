{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nmap
  ];
}
