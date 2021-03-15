{ inputs, pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
    };

    home.packages = with pkgs; [
      python39Packages.pynvim
    ];

    xdg.configFile = {
      "nvim/init.vim".source = "${inputs.vim-config}/init.vim";
      "nvim/ginit.vim".source = "${inputs.vim-config}/ginit.vim";
      "nvim/init".source = "${inputs.vim-config}/init";
      "nvim/after".source = "${inputs.vim-config}/after";
      "nvim/autoload".source = "${inputs.vim-config}/autoload";
      "nvim/plugin".source = "${inputs.vim-config}/plugin";
    };
  };
}
