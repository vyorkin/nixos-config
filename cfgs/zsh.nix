{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    ohMyZsh.enable = true;
    ohMyZsh.plugins = [
      "z"
      "git"
      "gitignore"
    # "git-extras"
    # "github"
    # "git-auto-fetch"
      "history-substring-search"
      "zsh-autosuggestions"
    # "history"
    # "systemd"
    # "rsync"
    # "zsh_reload"
    # "sudo"
    # "tmux"
    # "mix"
    # "stack"
    # "docker"
    # "docker-compose"
    # "emacs"
      "colored-man-pages"
      "command-not-found"
    # "extract"
      "httpie"
    ];
    ohMyZsh.theme = "minimal";
  };
}
