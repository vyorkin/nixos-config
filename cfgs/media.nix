{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsaUtils
    vlc
    mpv
    ffmpeg-full
    ffmpegthumbnailer
    flac

    ardour
    grip
    lame
    imagemagick7
    feh

    # image, 3d, video editing

    # gimp-with-plugins
    # blender

    # kdeApplications.kdenlive
    # frei0r
  ];
}
