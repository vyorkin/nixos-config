{ pkgs, ... }:

{
  home-manager.users.vyorkin = {

    home.file.".zshenv" = { source = ./dotfiles/zsh/zshenv; };
    home.file.".zprofile" = { source = ./dotfiles/zsh/zprofile; };
    home.file.".zlogin" = { source = ./dotfiles/zsh/zlogin; };
    home.file.".zlogout" = { source = ./dotfiles/zsh/zlogout; };
    home.file.".zconfig" = { source = ./dotfiles/zsh/zconfig; };

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;

      history.expireDuplicatesFirst = true;

      sessionVariables = {
        FZF_MARKS_JUMP = "^x^j";
        GEOMETRY_PROMPT_PLUGINS = [];
        PROMPT_GEOMETRY_COLORIZE_SYMBOL = false;
        ZSH_PLUGINS_ALIAS_TIPS_TEXT = "> ";
      };

      initExtra = ''
        # load custom executable functions and aliases
        for f in ~/.zconfig/functions/*; do source $f; done
        for f in ~/.zconfig/aliases/*; do source $f; done

        . ~/.zconfig/setup.zsh

        [[ -f ~/.dotsecrets/secret_tokens ]] && . ~/.dotsecrets/secret_tokens

        any-nix-shell zsh --info-right | source /dev/stdin

        bindkey '^Y' fuzzy-search-and-edit
      '';

      plugins = with pkgs; [
        {
          name = "zsh-async";
          file = "async.plugin.zsh";
          src = fetchFromGitHub {
            owner = "mafredri";
            repo = "zsh-async";
            rev = "e6d937228729f934f2033039bb54c3a18f5f1358";
            sha256 = "0f0bqm4245ghx31x30ircfp4njji834495g25wvrd93k2r96a669";
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
            rev = "d42626ef65fd3b1f8f72d30e9af5d515a0ec5e0b";
            sha256 = "1a2lccwmk8li7pwwngpbb91ckjdyziim9b5pa2vrygbnhfdfbs21";
          };
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "b2609ca787803f523a18bb9f53277d0121e30389";
            sha256 = "01w59zzdj12p4ag9yla9ycxx58pg3rah2hnnf3sw4yk95w3hlzi6";
          };
        }
        {
          name = "z";
          file = "zsh-z.plugin.zsh";
          src = fetchFromGitHub {
            owner = "agkozak";
            repo = "zsh-z";
            rev = "5b903f8f5489783ee2a4af668a941b7d9a02efc9";
            sha256 = "07h6ksiqgqyf5m84hv5xf4jcqrl8q1cj8wd4z52cjmy82kk10fkn";
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
          };
        }
        {
          name = "fzf-marks";
          file = "fzf-marks.plugin.zsh";
          src = fetchgit {
            url = "https://github.com/urbainvaes/fzf-marks";
            rev = "1.1";
            sha256 = "0wfh267kfvyx7vcyqpqv7qgi6vcffxziq5avqddnbkm3z51br0n4";
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
            rev = "f03ff8ffce9f3e488b6a0265cb09288cc29899fe";
            sha256 = "1qlbjn0q87jgjir3k7w4m8p6wqgjl2c7jnilczf7c205fgwksdhi";
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
          };
        }
        {
          name = "zsh-fuzzy-search-and-edit";
          file = "plugin.zsh";
          src = fetchFromGitHub {
            owner = "seletskiy";
            repo = "zsh-fuzzy-search-and-edit";
            rev = "4fbb3d351b75f1007df0d5cb09292bb2321f903a";
            sha256 = "1shhmda1iqwz79y2ianmjs5623zabckxfj2hqw4gl2axpkwnj1ib";
          };
        }
        {
          name = "fast-syntax-highlighting";
          src = fetchFromGitHub {
            owner = "zdharma";
            repo = "fast-syntax-highlighting";
            rev = "3601297ebfd67f208f489189e984df665ec9242c";
            sha256 = "026ykxgfy0p7y3wcsq0z3kmrs0n67rmxf89kqmiw5vxr9l67jr6l";
          };
        }
      ];
    };
  };
}
