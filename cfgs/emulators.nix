{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bochs
    qemu
  ];
}
