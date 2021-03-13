{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      clang
      autoconf
      automake
      m4
      gnumake
      cmake
      ccls
      meson
      ninja
      ccache
    ];
  };
}
