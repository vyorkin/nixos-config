{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tcl
    tcllib
    tcltls
    tclx
  ];
}
