{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vlc
    mpv
    ffmpeg
  ];
}
