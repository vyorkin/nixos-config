{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ckbcomp
    xkb-switch
    xkbmon
    xxkb
  ];
}
