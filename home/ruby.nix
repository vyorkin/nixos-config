{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".aprc" = { source = ./dotfiles/ruby/aprc; };
      ".erdconfig" = { source = ./dotfiles/ruby/erdconfig; };
      ".gemrc" = { source = ./dotfiles/ruby/gemrc; };
      ".guardrc" = { source = ./dotfiles/ruby/guardrc; };
      ".irbrc" = { source = ./dotfiles/ruby/irbrc; };
      ".pryrc" = { source = ./dotfiles/ruby/pryrc; };
      ".rdebugrc" = { source = ./dotfiles/ruby/rdebugrc; };
      ".rspec" = { source = ./dotfiles/ruby/rspec; };
      ".dotpryrc" = { source = ./dotfiles/ruby/dotpryrc; };

      ".gas" = {
        source = ./dotfiles/ruby/gas;
        recursive = true;
      };
  
      ".bundle" = {
        source = ./dotfiles/ruby/bundle;
        recursive = true;
      };
    };
  };
}
