{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    obs-studio

    # obs-ndi
    # obs-v4l2sink

    # simplescreenrecorder
  ];
}
