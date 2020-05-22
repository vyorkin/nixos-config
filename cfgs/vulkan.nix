{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vulkan-headers
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
  ];
}
