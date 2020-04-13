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

  # avrbinutils
    avrdude
  # avrdudess
    avr8burnomat
    simavr
    avra

    uisp

    dfu-util
    platformio

    stlink

    verilog
    gtkwave
    verilator
    # quartus-prime-lite

    minicom
    uucp

    stm32flash
    stm32loader

    esphome
    # esptool
    # esptool-ck
    mpfshell
    mkspiffs
  ];
}
