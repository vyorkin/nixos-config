{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    prettyping
    inetutils
    nmap
    iw
  ];
}
