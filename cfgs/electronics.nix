{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qucs
    caneda

    arduino-core
    arduino-mk

    picocom
    eagle
    openscad
    geda
    ngspice
    # kicad

    # Software for Saleae logic analyzers
    saleae-logic

    pkgsCross.avr.avrlibc
    pkgsCross.avr.buildPackages.binutils
    pkgsCross.avr.buildPackages.gcc

  # avrlibc
  # avrgcc
  # avrbinutils
    avrdude
    # avrdudess
    avr8burnomat

    dfu-util
    platformio

    stlink

    verilog
    gtkwave
    verilator
  ];
}
