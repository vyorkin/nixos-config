{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustc
    rustup
    # rustracer
    cargo
    carnix
  ];
}
