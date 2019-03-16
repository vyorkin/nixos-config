{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    datefudge
    elfinfo
    flamegraph

    gdb
    # gdbgui

    idutils
    ltrace

    ngrep

    patchelf
    patchutils

    pcapfix

    radare2
    radare2-cutter

    retdec
    rr
    valgrind
  ];
}
