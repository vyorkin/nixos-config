{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      clang
      clang-tools
      autoconf
      automake
      m4
      gnumake
      gdb
      cmake
      ccls
      bear
      meson
      ninja
      # ccache
      cpplint
    ];
  };
}
