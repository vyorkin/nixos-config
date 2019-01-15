{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    breeze-qt5
  ];
}
