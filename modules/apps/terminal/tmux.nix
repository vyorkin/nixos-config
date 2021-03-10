{ pkgs, inputs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".tmux" = { source = "${inputs.tmux-config}/tmux"; };
    };

    programs.tmux = {
      enable = true;
      extraConfig = builtins.readFile "${inputs.tmux-config}/tmux.conf";
    };
  };
}
