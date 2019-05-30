{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = { ".ideavimrc" = { source = ./dotfiles/idea/ideavimrc; }; };
  };
}
