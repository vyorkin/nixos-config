{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arduino
    arduino-core
    arduino-mk
    fritzing
    ino
  ];
}
