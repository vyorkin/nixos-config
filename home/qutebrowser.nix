{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "qutebrowser" = {
        source = ./dotfiles/qutebrowser;
        target = ".config/qutebrowser";
        recursive = true;
      };
    };
  };
}
