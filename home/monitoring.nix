{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "ksysguard" = {
        source = ./dotfiles/ksysguard;
        target = ".config/ksysguard";
        recursive = true;
      };
    };
  };
}
