{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    breeze-qt5
    qt5.qtbase
  ];
}
