{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".lein" = {
        source = ./dotfiles/clojure/lein;
        recursive = true;
      };
    };
  };
}
