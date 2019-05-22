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

    # 3d & video editing

    # blender

    # kdeApplications.kdenlive
    # frei0r
  ];
}
