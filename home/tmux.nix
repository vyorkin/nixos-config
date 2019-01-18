{ pkgs, ... }:

{
  home.file = {
    ".tmux" = { source = ./dotfiles/tmux/tmux; };
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./dotfiles/tmux/tmux.conf;
    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.open
      tmuxPlugins.prefix-highlight
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
        set -g @resurrect-strategy-nvim 'session'
        set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      tmuxPlugins.fzf-tmux-url
    ];
    tmuxinator.enable = true;
  };
}
