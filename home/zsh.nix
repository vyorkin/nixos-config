{ pkgs, inputs, ... }:

let initExtra = builtins.readFile "${inputs.zsh}/zshrc";
in {
  home-manager.users.vyorkin = {

    home.file = {
      ".zshenv" = { source = "${inputs.zsh}/zshenv"; };
      ".zprofile" = { source = "${inputs.zsh}/zprofile"; };
      ".zlogin" = { source = "${inputs.zsh}/zlogin"; };
      ".zlogout" = { source = "${inputs.zsh}/zlogout"; };
      ".zconfig" = { source = "${inputs.zsh}/zconfig"; };
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
            rev = "490167c4aa5a870b3da1458859bcf3a9d1e24f97";
            sha256 = "1vlr8fkk3k4cz3sxz3qmlkfsqxw251igbn9raz3lga4p213m98jb";
            # date = 2020-05-14T20:58:18+03:00;
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
            rev = "6ae30544a284301026d4ee1c437b44f5d1a9952e";
            sha256 = "1y6nx0ww2vlgwwbajwlvf1ywczpd8115c1my4mmv4fkb6q97i05g";
            # date = 2020-06-30T18:08:41+02:00;
          };
        }
        {
          name = "z";
          file = "zsh-z.plugin.zsh";
          src = fetchFromGitHub {
            owner = "agkozak";
            repo = "zsh-z";
            rev = "ae71aabec5472095b01d25b4c341adb349c277f4";
            sha256 = "1b3ad39l90jqzvfym6xl7lxsmab0anmjs7viiz8ldxddad9106b0";
            # date = 2020-06-30T15:54:24-07:00;
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
            rev = "366908cbb7e25407a2b8670cec55ac70ac540ebb";
            sha256 = "0pi7896frl6f41iqldxg3r14msc750bxha68fp3npxwz6akqqrbj";
            # date = 2020-06-15T21:32:20+02:00;
          };
        }
        {
          name = "git-extra-commands";
          file = "git-extra-commands.plugin.zsh";
          src = fetchFromGitHub {
            owner = "unixorn";
            repo = "git-extra-commands";
            rev = "547f215b81e3ded4f9fe19d0835b22fa65e06bd2";
            sha256 = "1p8ka9dabbr9k40xchr09mwcalq265rg9hiq5prbg86b9aj380kj";
            # date = 2020-06-20T08:47:00-06:00;
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
            rev = "865566ce48cfd9bb5cdbaf5b1a74b0a675f4ccd4";
            sha256 = "00d6nssh73k26w69fdp8iff1xghyr8ziy5w5a2li0z9lvm6j0nik";
            # date = 2020-07-04T01:56:49+02:00;
          };
        }
      ];
    };
  };
}
