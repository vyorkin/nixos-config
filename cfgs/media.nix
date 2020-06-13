{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # alsaUtils

    vlc
    mpv
    ffmpeg-full
    ffmpegthumbnailer
    flac
    cmus

    mplayer
    smplayer

    # ttyrec
    ttygif

    google-play-music-desktop-player

    # spotify
    # spotifywm

    # sunvox
    # tiled

    audacity

    ardour
    grip
    lame
    imagemagickBig
    # imagemagick7
    feh

    # image, 3d, video editing

    # gimp-with-plugins
    # blender

    # kdeApplications.kdenlive
    # frei0r

    # reaper
    # musescore
  ];
}
