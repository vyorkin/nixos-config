{ pkgs, ... }:

{
  imports = [
    ./dotsecrets.nix
    ./ssh.nix
    ./zsh.nix
    ./tmux.nix
    ./git.nix
    ./alacritty.nix
  # ./i3.nix
    ./vim.nix
    ./emacs.nix
    ./irc.nix
    ./idea.nix
    ./postgresql.nix
    ./haskell.nix
    ./ruby.nix
    ./javascript.nix
    ./rust.nix
    ./clojure.nix
  ];

  systemd.user.startServices = true;

  programs = {
    home-manager = {
      enable = true;
      path = https://github.com/rycee/home-manager/archive/master.tar.gz;
    };
  };
}
