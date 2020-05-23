{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ib-tws
    ib-controller
  ];
}
