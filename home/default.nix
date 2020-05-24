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
    ./autorandr.nix
    ./zathura.nix
    ./minizinc.nix
    ./irc.nix
    ./idea.nix
    ./monitoring.nix
    ./mps-youtube.nix
  ];

  home-manager.users.vyorkin = {
    news.display = "silent";
    xdg.enable = true;
    services = {
      udiskie.enable = true;
      blueman-applet.enable = true;
      lorri.enable = true;
    };
    systemd.user.startServices = true;

    # A better way to navigate directories
    # https://github.com/Canop/broot
    programs.broot.enable = true;
  };
}
