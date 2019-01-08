{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
    tmuxPlugins.sensible
    tmuxPlugins.yank
    tmuxPlugins.open
    tmuxPlugins.prefix-highlight
    tmuxPlugins.resurrect
    tmuxPlugins.fzf-tmux-url
    tmuxinator
  ];

  programs.tmux.extraTmuxConf = ''
  # tmux ressurect neovim
  set -g @resurrect-strategy-nvim 'session'

  # enables saving and restoring tmux pane contents
  set -g @resurrect-capture-pane-contents 'on'

  # prefix highlight
  set -g @prefix_highlight_fg 'white'
  set -g @prefix_highlight_bg 'blue'

  set -g @online_icon 'online'
  set -g @offline_icon 'offline'
  '';
}
