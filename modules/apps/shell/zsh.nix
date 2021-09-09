{ pkgs, inputs, ... }:

let
  initExtra = builtins.readFile "${inputs.zsh-config}/zshrc";
in {
  environment.sessionVariables.SHELL = "zsh";
  # Symlink /share/zsh
  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.vyorkin = {
    home.file = {
      ".zshenv" = { source = "${inputs.zsh-config}/zshenv"; };
      ".zprofile" = { source = "${inputs.zsh-config}/zprofile"; };
      ".zlogin" = { source = "${inputs.zsh-config}/zlogin"; };
      ".zlogout" = { source = "${inputs.zsh-config}/zlogout"; };
      ".zconfig" = { source = "${inputs.zsh-config}/zconfig"; };
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;

      history = rec {
        expireDuplicatesFirst = true;
        size = 1000000;
        save = size;
      };

      sessionVariables = {
        FZF_MARKS_JUMP = "^x^j";
        ZSH_PLUGINS_ALIAS_TIPS_TEXT = "> ";

        GEOMETRY_PROMPT_SUFFIX="$(if [ ! -z $IN_NIX_SHELL ]; then echo ' [nix]'; fi)";
        GEOMETRY_GIT_SYMBOL_STASHES="x";     # change the git stash indicator to `x`
        GEOMETRY_GIT_GREP="rg";              # define which grep-like tool to use (By default it looks for rg, ag and finally grep)
        GEOMETRY_GIT_NO_COMMITS_MESSAGE="";  # hide the 'no commits' message in new repositories
        GEOMETRY_GIT_TIME_DETAILED=true;     # show full time (e.g. `12h 30m 53s`) instead of the coarsest interval (e.g. `12h`)
      };

      inherit initExtra;
    };

    # Enable zsh integration for broot.
    # See: https://github.com/Canop/broot
    programs.broot.enableZshIntegration = true;
  };
}
