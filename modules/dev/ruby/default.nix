{ inputs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".aprc" = { source = ./aprc; };
      ".erdconfig" = { source = ./erdconfig; };
      ".gemrc" = { source = ./gemrc; };
      ".guardrc" = { source = ./guardrc; };
      ".irbrc" = { source = ./irbrc; };
      ".pryrc" = { source = ./pryrc; };
      ".rdebugrc" = { source = ./rdebugrc; };
      ".rspec" = { source = ./rspec; };

      ".dotpryrc" = { source = "${inputs.dotpryrc}/dotpryrc"; };

      ".gas" = {
        source = ./gas;
        recursive = true;
      };

      ".bundle" = {
        source = ./bundle;
        recursive = true;
      };
    };
  };
}
