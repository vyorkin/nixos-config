{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mesa
    freeglut
    glfw
  ];
}
