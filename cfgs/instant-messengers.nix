{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tdesktop
  ];
}
