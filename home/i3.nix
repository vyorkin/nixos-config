{ ... }:

{
  imports = [
    ./rofi.nix
    ./dunst.nix
    ./twmn.nix
  ];

  home.file = {
    "i3" = {
      source = ./dotfiles/i3;
      target = ".config/i3";
    };
  };
}
