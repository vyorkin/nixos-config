{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # taskwarrior
    # taskserver
    wakatime
  ];
}
