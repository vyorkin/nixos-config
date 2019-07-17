{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "minizinc" = {
        source = ./dotfiles/minizinc;
        target = ".minizinc";
        recursive = true;
      };
    };
  };
}
