{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    datefudge
    diffoscope
    elfinfo
    flamegraph

    gdb
    gdbgui

    # idutils

    ngrep

    patchelf
    patchutils

    pcapfix

    radare2
    radare2-cutter

    # retdec
    rr
    valgrind

    sysdig
    vmtouch
    vulnix
  ];
}
