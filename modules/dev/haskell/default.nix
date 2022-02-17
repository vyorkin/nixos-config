{ pkgs, ... }:

{
  imports = [
    ./hoogle.nix
  ];

  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      # haskell.compiler.ghc901
      cabal-install
    ];
    home.file = {
      "ghci.conf" = {
        source = ./ghci;
        target = ".ghc/ghci.conf";
      };

      ".hindent.yaml" = { source = ./hindent.yaml; };
      ".stylish-haskell.yaml" = {
        source = ./stylish-haskell.yaml;
      };
      ".hspec" = { source = ./hspec; };
      ".summoner.toml" = { source = ./summoner.toml; };
      ".hlint.yaml" = { source = ./hlint.yaml; };
      ".haskeline" = { source = ./haskeline; };

      ".cabal" = {
        source = ./cabal;
        recursive = true;
      };

      ".stack" = {
        source = ./stack;
        recursive = true;
      };
    };
  };
}
