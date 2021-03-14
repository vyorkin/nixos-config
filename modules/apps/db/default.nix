{ pkgs, ... }:

{
  imports = [
    ./postgresql
  ];

  environment.systemPackages = with pkgs; [
    redis
    mysql
    sqlite
    sqlitebrowser
    rocksdb
    mdbtools
  ];
}
