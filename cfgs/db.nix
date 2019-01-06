{ pkgs, ... }:

{
  home.packages = with pkgs; [
    postgresql
    redis
    mysql
    sqlite
    mongodb
  ];
}
