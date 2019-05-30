{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".gitconfig" = { source = ./dotfiles/git/gitconfig; };
      ".gitignore" = { source = ./dotfiles/git/gitignore; };
      ".gitmessage" = { source = ./dotfiles/git/gitmessage; };
    };
  };
}
