{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zeal
    doxygen
    tealdeer
  ];
}
