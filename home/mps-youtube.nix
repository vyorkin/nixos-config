
{ ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      "mpv" = {
        source = ./dotfiles/mps-youtube/mpv.sh;
        target = ".config/mps-youtube/mpv.sh";
        executable = true;
      };
    };
  };
}
