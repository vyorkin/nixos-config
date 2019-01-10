{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arduino_core
    avrdude
    picocom
    eagle
    openscad
    geda
    ngspice
  ];
}
