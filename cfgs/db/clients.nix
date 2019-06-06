{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mycli
    pgcli
    pgcenter
  ];
}
