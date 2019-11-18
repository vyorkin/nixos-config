{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    cmake
    llvm
    ccls
    boost
    compcert
  ];
}
