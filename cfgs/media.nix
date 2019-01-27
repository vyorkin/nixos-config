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
    imagemagick7
  ];
}
