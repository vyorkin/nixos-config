{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsaUtils
    vlc
    mpv
    ffmpeg-full
    ffmpegthumbnailer
    flac
    cmus

    # ttyrec
    ttygif

    spotify
    spotifywm

    sunvox
    tiled

    ardour
    grip
    lame
    imagemagickBig
    # imagemagick7
    feh

    # image, 3d, video editing

    # gimp-with-plugins
    # blender

    kdeApplications.kdenlive
    # frei0r
  ];
}
