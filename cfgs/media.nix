{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsaUtils
    vlc
    mpv
    recordmydesktop
    ffmpeg-full
    ffmpegthumbnailer
    flac
    cmus

    spotify
    spotifywm

    sunvox
    tiled

    ardour
    grip
    lame
    imagemagick7
    feh

    # image, 3d, video editing

    # gimp-with-plugins
    # blender

    kdeApplications.kdenlive
    # frei0r
  ];
}
