{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # mesa
    libGL
    libGLU

    glslang
    glslviewer

    # amdgpu-pro
  ];
}
