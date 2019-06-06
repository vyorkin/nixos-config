{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".npmrc" = { source = ../dotfiles/javascript/npmrc; };
    };
  };
}
