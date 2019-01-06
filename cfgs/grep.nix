{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ack
    ripgrep
    ag
  ];
}
