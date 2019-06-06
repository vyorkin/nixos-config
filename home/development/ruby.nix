{ ... }:

let basePath = ../dotfiles/ruby;
in {
  home-manager.users.vyorkin = {
    home.file = {
      ".aprc" = { source = basePath + "/aprc"; };
      ".erdconfig" = { source = basePath + "/erdconfig"; };
      ".gemrc" = { source = basePath + "/gemrc"; };
      ".guardrc" = { source = basePath + "/guardrc"; };
      ".irbrc" = { source = basePath + "/irbrc"; };
      ".pryrc" = { source = basePath + "/pryrc"; };
      ".rdebugrc" = { source = basePath + "/rdebugrc"; };
      ".rspec" = { source = basePath + "/rspec"; };
      ".dotpryrc" = { source = basePath + "/dotpryrc"; };

      ".gas" = {
        source = basePath + "/gas";
        recursive = true;
      };

      ".bundle" = {
        source = basePath + "/bundle";
        recursive = true;
      };
    };
  };
}
