{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neomutt
    msmtp
    mu
    offlineimap
  ];
}
