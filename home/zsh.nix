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
      enableCompletion = true;

      history.expireDuplicatesFirst = true;

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

      plugins = with pkgs; [
        {
          name = "zsh-history-substring-search";
          src = zsh-history-substring-search;
        }
        {
          name = "zsh-autosuggestions";
          file = "zsh-autosuggestions.zsh";
          src = fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "ae315ded4dba10685dbbafbfa2ff3c1aefeb490d";
            sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
            # date = 2020-01-06T21:12:21-07:00;
          };
        }
        {
          name = "geometry";
          file = "geometry.plugin.zsh";
          src = fetchFromGitHub {
            owner = "geometry-zsh";
            repo = "geometry";
            rev = "d78d0daab3e16d19043fd225fe30bf38de3b33ad";
            sha256 = "sha256-S7WNIkgmsnUlSNCD+C67oKMhOiSwqluytGSG0eLYxWs=";
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
          name = "zsh-completions";
          file = "zsh-completions.plugin.zsh";
          src = fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-completions";
            rev = "454d236d3a793668b873a7b522353c68ec182cfa";
            sha256 = "1mpy041dg8b9krbsy5yg6p3mn1wyf1wg9j99m4y5686hljbmgxkf";
            # date = 2020-09-01T12:12:00+09:00;
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
            rev = "40d8e206c6d6e41e039397eb455bedca578d2ef8";
            sha256 = "17cifxi4zbzjh1damrwi2fyhj8x0y2m2qcnwgh4i62m1vysgv9xb";
            # date = 2020-05-25T11:31:48+02:00;
          };
        }
        {
          name = "fzf-marks";
          file = "fzf-marks.plugin.zsh";
          src = fetchgit {
            url = "https://github.com/urbainvaes/fzf-marks";
            rev = "19c526a521ca231a8396362614979b6af2ad6262";
            sha256 = "02sb8jjx6316cpp99baq5jqaw54a7a45j6w62zsp1k69kq6k4kn4";
            # date = 2020-08-12T11:17:18+02:00;
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
        # {
        #   name = "zsh-fuzzy-search-and-edit";
        #   file = "plugin.zsh";
        #   src = fetchFromGitHub {
        #     owner = "seletskiy";
        #     repo = "zsh-fuzzy-search-and-edit";
        #     rev = "bd4182bd81b176fedd8fa13c62e2c6662390e025";
        #     sha256 = "005l5ihhzlb3rpa34ikwfjc10glcdjph6qzjs5w7vdznd8gdcag2";
        #     # date = 2019-12-20T15:20:28+03:00;
        #   };
        # }
        {
          name = "fast-syntax-highlighting";
          src = fetchFromGitHub {
            owner = "zdharma";
            repo = "fast-syntax-highlighting";
            rev = "a47b5088636c3678c7baa22710d10b0c45bc9265";
            sha256 = "00d6nssh73k26w69fdp8iff1xghyr8ziy5w5a2li0z9lvm6j0nik";
            # date = 2020-08-12T01:48:43+02:00;
          };
        }
      ];
    };
  };
}
