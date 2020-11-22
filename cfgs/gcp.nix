{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    google-cloud-sdk
  ];
}
