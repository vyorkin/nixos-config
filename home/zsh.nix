{ pkgs, ... }:

{
  home-manager.users.vyorkin = {

    home.file = {
      ".zshenv" = { source = ./dotfiles/zsh/zshenv; };
      ".zprofile" = { source = ./dotfiles/zsh/zprofile; };
      ".zlogin" = { source = ./dotfiles/zsh/zlogin; };
      ".zlogout" = { source = ./dotfiles/zsh/zlogout; };
      ".zconfig" = { source = ./dotfiles/zsh/zconfig; };
    };

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;

      history.expireDuplicatesFirst = true;

      sessionVariables = {
        FZF_MARKS_JUMP = "^x^j";
        ZSH_PLUGINS_ALIAS_TIPS_TEXT = "> ";
        # GEOMETRY_PROMPT_SUFFIX="$(if [ ! -z $IN_NIX_SHELL ]; then echo ' [nix]'; fi)";
      };

      initExtra = ''
        # load custom executable functions and aliases
        for f in ~/.zconfig/functions/*; do source $f; done
        for f in ~/.zconfig/aliases/*; do source $f; done

        . ~/.zconfig/setup.zsh

        eval "$(direnv hook zsh)"
        eval "$(starship init zsh)"

        [[ -f ~/.secret_tokens ]] && . ~/.secret_tokens

        bindkey '^Y' fuzzy-search-and-edit
      '';

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
        # {
        #   name = "geometry";
        #   file = "geometry.plugin.zsh";
        #   src = fetchFromGitHub {
        #     owner = "geometry-zsh";
        #     repo = "geometry";
        #     rev = "d42626ef65fd3b1f8f72d30e9af5d515a0ec5e0b";
        #     sha256 = "1a2lccwmk8li7pwwngpbb91ckjdyziim9b5pa2vrygbnhfdfbs21";
        #   };
        # }
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
            rev = "a00ea49ff1e11637c479697beafd8514c1720579";
            sha256 = "19mnmf0agwb03han6879dp5i8yr9lqxh8r2zf8w691ynywy3rl5b";
            # date = 2020-01-08T10:07:41-08:00;
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
            rev = "e0c4530d7ece4ecb749023f6663ebd59469ccb74";
            sha256 = "1znpkxwm0plszp073zyvakkxnjq8fkr9dfkf5lfz3c1xz0ihb63v";
            # date = 2019-12-31T13:35:03+01:00;
          };
        }
        {
          name = "zsh-notify";
          file = "notify.plugin.zsh";
          src = fetchFromGitHub {
            owner = "marzocchi";
            repo = "zsh-notify";
            rev = "853bc9434771b99b028f069b95e13ecdf06901d0";
            sha256 = "0bhmv1xfjzmci9b4dy3mix2s31zj0kayrl44xx5xb8rgzlf0qbvr";
          };
        }
        {
          name = "git-extra-commands";
          file = "git-extra-commands.plugin.zsh";
          src = fetchFromGitHub {
            owner = "unixorn";
            repo = "git-extra-commands";
            rev = "323f34756ede38e157263fdb3b145856f6ba23dc";
            sha256 = "0svs3j1wdlwdxmkrkf2mgywcqc9qlprfhakvsq3yavyymkjpb7fi";
            # date = 2019-12-16T08:19:35-07:00;
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
            rev = "1daabc228279be7b397f0dab7c13e22e204ff8d5";
            sha256 = "0gcf65d997nx80rsj18g005vfw5qh20m1391z0y8lcm3l55zmc7q";
            # date = 2020-01-13T04:45:36+01:00;
          };
        }
      ];
    };
  };
}
