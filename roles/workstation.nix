{ pkgs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  system.autoUpgrade.enable = true;
}
