{ ... }:

let basePath = ../dotfiles/haskell;
in {
  home-manager.users.vyorkin = {
    home.file = {
      "ghci.conf" = {
        source = basePath + "/ghci";
        target = ".ghc/ghci.conf";
      };

      ".hindent.yaml" = { source = basePath + "/hindent.yaml"; };
      ".stylish-haskell.yaml" = {
        source = basePath + "/stylish-haskell.yaml";
      };
      ".hspec" = { source = basePath + "/hspec"; };
      ".summoner.toml" = { source = basePath + "/summoner.toml"; };
      ".hlint.yaml" = { source = basePath + "/hlint.yaml"; };
      ".haskeline" = { source = basePath + "/haskeline"; };

      ".cabal" = {
        source = basePath + "/cabal";
        recursive = true;
      };

      ".stack" = {
        source = basePath + "/stack";
        recursive = true;
      };
    };
  };
}
