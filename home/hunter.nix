{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "hunter" = {
        source = ./dotfiles/hunter;
        target = ".config/hunter";
        recursive = true;
      };
    };
  };
}
