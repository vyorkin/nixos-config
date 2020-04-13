{ pkgs, ... }:

let initExtra = builtins.readFile ./dotfiles/zsh/zshrc;
in {
  home-manager.users.vyorkin = {

    home.file = {
      ".zshenv" = { source = ./dotfiles/zsh/zshenv; };
      ".zprofile" = { source = ./dotfiles/zsh/zprofile; };
      ".zlogin" = { source = ./dotfiles/zsh/zlogin; };
      ".zlogout" = { source = ./dotfiles/zsh/zlogout; };
      ".zconfig" = { source = ./dotfiles/zsh/zconfig; };
    };

    programs.broot.enableZshIntegration = true;

    programs.zsh = {
      enable = true;
      enableCompletion = false;

      history.expireDuplicatesFirst = true;

      sessionVariables = {
        FZF_MARKS_JUMP = "^x^j";
        ZSH_PLUGINS_ALIAS_TIPS_TEXT = "> ";

        GEOMETRY_PLUGIN_SEPARATOR=" ";
        GEOMETRY_PROMPT_SUFFIX="$(if [ ! -z $IN_NIX_SHELL ]; then echo ' [nix]'; fi)";
        GEOMETRY_GIT_SYMBOL_STASHES="x";     # change the git stash indicator to `x`
        GEOMETRY_GIT_GREP="rg";              # define which grep-like tool to use (By default it looks for rg, ag and finally grep)
        GEOMETRY_GIT_NO_COMMITS_MESSAGE="";  # hide the 'no commits' message in new repositories
        GEOMETRY_GIT_TIME_DETAILED=true;     # show full time (e.g. `12h 30m 53s`) instead of the coarsest interval (e.g. `12h`)
      };

      inherit initExtra;

      plugins = with pkgs; [
        {
          name = "zsh-async";
          file = "async.plugin.zsh";
          src = fetchFromGitHub {
            owner = "mafredri";
            repo = "zsh-async";
            rev = "95c2b1577f455728ec01cec001a86c216d0af2bd";
            sha256 = "0kp94pqpy7qbmy51s6iwpnc96a1aq0nmmdp5fgssksan070hnw96";
            # date = 2019-06-20T18:02:16+03:00;
          };
        }
        {
          name = "zsh-history-substring-search";
          src = zsh-history-substring-search;
        }
        {
          name = "geometry";
          file = "geometry.plugin.zsh";
          src = fetchFromGitHub {
            owner = "geometry-zsh";
            repo = "geometry";
            rev = "fdff57bde4afb43beda73a14dea7738961f99bc2";
            sha256 = "02knbmcf8invkvz0g42xk3dlk4lqffk43bsmi8z4n01508jqkd8g";
            # date = 2019-09-02T11:00:58-04:00;
          };
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "a65382a353eaee5a98f068c330947c032a1263bb";
            sha256 = "0l41ac5b7p8yyjvpfp438kw7zl9dblrpd7icjg1v3ig3xy87zv0n";
            # date = 2019-12-20T12:15:36+01:00;
          };
        }
        {
          name = "z";
          file = "zsh-z.plugin.zsh";
          src = fetchFromGitHub {
            owner = "agkozak";
            repo = "zsh-z";
            rev = "d203aa3c24892fafa74ec8a65605ffaf2fc7af3d";
            sha256 = "0h7g6iga7xvkw5y89qbrx3f1c873zs6s04f4yldsrmq9xldx2cdv";
            # date = 2020-03-11T08:17:22-07:00;
          };
        }
        {
          name = "alias-tips";
          file = "alias-tips.plugin.zsh";
          src = fetchFromGitHub {
            owner = "djui";
            repo = "alias-tips";
            rev = "29bf28c1b6abea03c582e48ee262feb69b324650";
            sha256 = "0fpz0xrqjchzhld45c8y8i9r8s14k2pwc4ccl69idr29v53m8m2m";
            # date = 2018-12-10T17:45:33+01:00;
          };
        }
        {
          name = "fzf-marks";
          file = "fzf-marks.plugin.zsh";
          src = fetchgit {
            url = "https://github.com/urbainvaes/fzf-marks";
            rev = "6f99132616f0ae57105df5b9de37cad26ad3b763";
            sha256 = "1i66i7qxgczd8gk5kbdhh7ij5km4312r3iwz3yachz8w0jf0vk5k";
            # date = 2020-01-21T14:13:18+00:00;
          };
        }
        {
          name = "git-extra-commands";
          file = "git-extra-commands.plugin.zsh";
          src = fetchFromGitHub {
            owner = "unixorn";
            repo = "git-extra-commands";
            rev = "a491fd35e9ba9f0a0980081f3d927e5d861ae5fa";
            sha256 = "1vqbxlvkfqbpiam0g0qykbmxf0lh6pmlcl3ljg4b7wsi31rndyqv";
            # date = 2020-03-03T09:01:16-07:00;
          };
        }
        {
          name = "zsh-reentry-hook";
          file = "zsh-reentry-hook.plugin.zsh";
          src = fetchFromGitHub {
            owner = "RobSis";
            repo = "zsh-reentry-hook";
            rev = "8587186df8f08b8a57ae7f87ab0bc7d503909031";
            sha256 = "1jgin1gmw05vxf7vw414zvhq9dg06yzlzxas723f710vs58mf11a";
            # date = 2016-04-04T14:29:07+02:00;
          };
        }
        {
          name = "zsh-fuzzy-search-and-edit";
          file = "plugin.zsh";
          src = fetchFromGitHub {
            owner = "seletskiy";
            repo = "zsh-fuzzy-search-and-edit";
            rev = "bd4182bd81b176fedd8fa13c62e2c6662390e025";
            sha256 = "005l5ihhzlb3rpa34ikwfjc10glcdjph6qzjs5w7vdznd8gdcag2";
            # date = 2019-12-20T15:20:28+03:00;
          };
        }
        {
          name = "fast-syntax-highlighting";
          src = fetchFromGitHub {
            owner = "zdharma";
            repo = "fast-syntax-highlighting";
            rev = "303eeee81859094385605f7c978801748d71056c";
            sha256 = "0y0jgkj9va8ns479x3dhzk8bwd58a1kcvm4s2mk6x3n19w7ynmnv";
            # date = 2020-03-06T09:48:07+01:00;
          };
        }
      ];
    };
  };
}
