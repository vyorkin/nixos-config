{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    autoconf
    automake
    cmake
    ccls
    boost
    # compcert
    irony-server
    meson
    ninja
    ccache
  ];
}
