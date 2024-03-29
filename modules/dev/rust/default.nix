{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    cargo
  ];

  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      rust-analyzer
    ];

    home.file = { ".rustfmt.toml" = { source = ./rustfmt.toml; }; };
  };
}
