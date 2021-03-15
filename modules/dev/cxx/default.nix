{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      clang
      autoconf
      automake
      m4
      gnumake
      gdb
      cmake
      ccls
      meson
      ninja
      ccache
      cpplint
    ];
  };
}
