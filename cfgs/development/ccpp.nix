{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    cmake
    ccls
    boost
    compcert
  ];
}
