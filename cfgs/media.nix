{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsaUtils
    vlc
    mpv
    ffmpeg
    flac
    spotify
    ardour
    grip
    lame
  ];
}
