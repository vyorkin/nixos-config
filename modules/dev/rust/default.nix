{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      rustc
      rustup
      cargo
      carnix
    ];

    home.file = {
      ".rustfmt.toml" = { source = ./rustfmt.toml; };
    };
  };
}
