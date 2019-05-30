{ pkgs, ... }:

{
  imports = [
    ./dotsecrets.nix
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
    ./qutebrowser.nix
    ./irc.nix
    ./idea.nix
    ./postgresql.nix
    ./haskell.nix
    ./ruby.nix
    ./javascript.nix
    ./rust.nix
    ./clojure.nix
  ];

  home-manager.users.vyorkin = {
    news.display = "silent";
    xdg.enable = true;
    services.udiskie.enable = true;
    systemd.user.startServices = true;
  };
}
