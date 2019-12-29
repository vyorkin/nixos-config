{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    x11vnc
    tigervnc
  ];
}
