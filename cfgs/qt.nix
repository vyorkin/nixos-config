{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qt5.qtbase
  ];
}
