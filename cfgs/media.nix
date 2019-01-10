{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
