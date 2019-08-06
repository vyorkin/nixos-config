{ pkgs, ... }:
let
  lorri = import (fetchTarball {
    url = "https://github.com/target/lorri/archive/rolling-release.tar.gz";
  }) { };
in {
  home-manager.users.vyorkin = {
    home.packages = [lorri];
  };
}
