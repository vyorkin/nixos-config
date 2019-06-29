{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".agda" = {
        source = ../dotfiles/agda;
        recursive = true;
      };
    };
  };
}
