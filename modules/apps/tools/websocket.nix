{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ws
  ];
}
