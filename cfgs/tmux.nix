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
}
