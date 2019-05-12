{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gperf
  ];
}
