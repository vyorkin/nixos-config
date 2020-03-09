{ ... }:

{
  imports = [
    ./rofi.nix
    ./dunst.nix
    ./twmn.nix
  ];

  home-manager.users.vyorkin = {
    home.file."status.toml" = {
      source = ./dotfiles/i3/status.toml;
      target = ".config/i3/status.toml";
    };
  };
}
