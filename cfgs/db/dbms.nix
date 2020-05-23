{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    postgresql
    sqitchPg
    redis
    mysql
    sqlite
    # mongodb
  ];
}
