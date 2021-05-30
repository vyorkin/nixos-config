{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustc
    rustup
    cargo
    carnix
  ];

  home-manager.users.vyorkin = {
    home.packages = with pkgs; [ ];

    home.file = { ".rustfmt.toml" = { source = ./rustfmt.toml; }; };
  };
}
