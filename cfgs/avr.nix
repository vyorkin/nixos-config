{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  # avrlibc
  # avrgcc
  # avrbinutils
    avrdude
    avrdudess
    avr8burnomat
  ];
}
