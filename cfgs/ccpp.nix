{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clang
    cmake
    llvm
    ccls
    boost
  ];
}
