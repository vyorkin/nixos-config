{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    websocat
    ws
  ];
}
