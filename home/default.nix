{ pkgs, config, ... }:

{
  imports = [
    ./dotsecrets.nix
    ./db
    ./development
    ./web
    ./zsh.nix
    ./fish.nix
    ./tmux.nix
    ./git.nix
    ./terminal.nix
    ./vim.nix
    ./emacs.nix
    ./x11.nix
    ./gtk.nix
    ./keyboard.nix
    ./i3.nix
    ./mail.nix
    ./ranger.nix
    ./hunter.nix
    ./zathura.nix
    ./minizinc.nix
    ./irc.nix
    ./idea.nix
    ./monitoring.nix
    ./mps-youtube.nix

    # TODO: For some reason it was removed from config of the home PC
    ./autorandr.nix
  ];

  home-manager.users.vyorkin = {
    news.display = "silent";

    xdg.enable = true;

    services = {
      udiskie.enable = true;

      # TODO: Needs to be enabled on laptop
      # blueman-applet.enable = true;

      lorri.enable = true;
      network-manager-applet.enable = true;
      unclutter.enable = true;
      flameshot.enable = true;

      # pasystray.enable = true;
    };

    programs = {
      # A better way to navigate directories
      # https://github.com/Canop/broot
      broot.enable = true;
    };
    systemd.user.startServices = true;
  };
}
