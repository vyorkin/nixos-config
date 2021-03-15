{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    prettyping
    telnet
    nmap
    iw
  ];
}
