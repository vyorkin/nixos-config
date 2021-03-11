{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ffmpeg-full
    ffmpegthumbnailer
    imagemagickBig
  ];
}
