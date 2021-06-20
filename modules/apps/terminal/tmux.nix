{ pkgs, inputs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".tmux/plugins/tpm" = { source = inputs.tpm; };
      ".tmux.conf" = { source = "${inputs.tmux-config}/tmux.conf"; };
    };

    programs.tmux.enable = true;
  };
}
