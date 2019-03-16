{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mesa
    libGL
    libGLU
  ];
}
