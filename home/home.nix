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
    ./idea.nix
    ./postgresql.nix
    ./haskell.nix
    ./ruby.nix
    ./rust.nix
    ./clojure.nix
  ];

  programs = {
    home-manager = {
      enable = true;
      path = https://github.com/rycee/home-manager/archive/master.tar.gz;
    };
  };
}
