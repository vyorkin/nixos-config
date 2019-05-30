{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".weechat" = {
        source = ./dotfiles/weechat;
        recursive = true;
      };

      ".irssi" = {
        source = ./dotfiles/irssi;
        recursive = true;
      };
    };

    home.packages = with pkgs; [
      irssi
      weechat
    ];
  };
}
