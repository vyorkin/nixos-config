{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mesa
    libGL
    libGLU

    glslang
    glslviewer

    vulkan-headers
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
  ];
}
