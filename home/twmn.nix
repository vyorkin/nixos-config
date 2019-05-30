{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "twmn" = {
        source = ./dotfiles/twmn;
        target = ".config/twmn";
      };
    };
  };
}
