{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    ohMyZsh.enable = true;
    ohMyZsh.plugins = [
      "history-substring-search"
      "zsh-autosuggestions"
      "z"
      "colored-man-pages"
    # "command-not-found"
    # "tmux"
    # "emacs"
    # "stack"
    # "httpie"
    # "git"
    # "gitignore"
    # "git-extras"
    # "github"
    # "git-auto-fetch"
    # "history"
    # "systemd"
    # "rsync"
    # "zsh_reload"
    # "sudo"
    # "mix"
    # "docker"
    # "docker-compose"
    # "extract"
    ];
    ohMyZsh.theme = "minimal";
  };
}
