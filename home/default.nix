{ pkgs, ... }:

{
  imports = [
    ./dotsecrets.nix
    ./db
    ./development
    ./ssh.nix
    ./zsh.nix
    ./tmux.nix
    ./git.nix
    ./terminal.nix
    ./vim.nix
    ./emacs.nix
    ./x11.nix
    ./gtk.nix
    ./keyboard.nix
    ./i3.nix
    ./ranger.nix
    ./hunter.nix
    ./qutebrowser.nix
    ./irc.nix
    ./idea.nix
  ];

  home-manager.users.vyorkin = {
    news.display = "silent";
    xdg.enable = true;
    services.udiskie.enable = true;
    systemd.user.startServices = true;
  };
}
