{ ... }:

{
  home.file = {
    "init.vim" = {
      source = ./dotfiles/vim/init.vim;
      target = ".config/nvim/init.vim";
    };

    "after" = {
      source = ./dotfiles/vim/after;
      target = ".config/nvim/after";
    };

    "autoload" = {
      source = ./dotfiles/vim/autoload;
      target = ".config/nvim/autoload";
    };

    "colors" = {
      source = ./dotfiles/vim/colors;
      target = ".config/nvim/colors";
    };

    "plugin" = {
      source = ./dotfiles/vim/plugin;
      target = ".config/nvim/plugin";
    };

    "plugins.vim" = {
      source = ./dotfiles/vim/plugins.vim;
      target = ".config/nvim/plugins.vim";
    };
  };
}
