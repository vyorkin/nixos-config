{ pkgs, ... }:

let
  # Additional plugins
  themepack = pkgs.tmuxPlugins.mkDerivation {
    pluginName = "themepack";
    src = builtins.fetchGit {
      url = "https://github.com/jimeh/tmux-themepack";
      rev = "1b1b8098419daacb92ca401ad6ee0ca6894a40ca";
    };
  };
in {
  home-manager.users.vyorkin = {
    home.file = { ".tmux" = { source = ./dotfiles/tmux/tmux; }; };

    programs.tmux = {
      enable = true;
      extraConfig = builtins.readFile ./dotfiles/tmux/tmux.conf;
      plugins = with pkgs; [
        tmuxPlugins.yank
        tmuxPlugins.open
        tmuxPlugins.online-status
        tmuxPlugins.prefix-highlight
        # themepack
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
          # set -g @themepack 'default'
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        tmuxPlugins.fzf-tmux-url
      ];
      tmuxinator.enable = true;
    };
  };
}
