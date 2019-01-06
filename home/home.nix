{ pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./ssh.nix
    ./git.nix
  ];

  programs = {
    home-manager = {
      enable = true;
      path = https://github.com/rycee/home-manager/archive/master.tar.gz;
    };
  };
}
