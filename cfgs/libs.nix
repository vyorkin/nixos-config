{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gmp
    pcre
    gperf
    ncurses6
  ];
}
