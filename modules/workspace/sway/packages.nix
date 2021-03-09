{ pkgs, inputs, ... }: {

{
  home-manager.users.vyorkin.home.packages = with pkgs; [
    wl-clipboard
    grim
    slurp
    pass-wayland
  ];
}
