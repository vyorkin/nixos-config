{ pkgs, ... }:

{
  imports = [
    ./postgresql
  ];

  environment.systemPackages = with pkgs; [
    redis
    mysql
    sqlite
    rocksdb
  ];
}
