{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsaUtils
    vlc
    mpv
    ffmpeg
    ffmpegthumbnailer
    flac
    spotify
    ardour
    grip
    lame
  # imagemagick
    imagemagick7
    feh
  ];
}
