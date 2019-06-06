{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    postgresql
    redis
    mysql
    sqlite
    mongodb
  ];
}
