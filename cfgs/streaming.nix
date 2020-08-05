{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    obs-studio
    obs-linuxbrowser
    obs-v4l2sink
    # obs-ndi

    simplescreenrecorder
  ];
}
