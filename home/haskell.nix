{ ... }:

{
  home.file = {
    "ghci.conf" = {
      source = ./dotfiles/haskell/ghci;
      target = ".ghc/ghci.conf";
    };

    ".hindent.yaml" = { source = ./dotfiles/haskell/hindent.yaml; };
    ".stylish-haskell.yaml" = {
      source = ./dotfiles/haskell/stylish-haskell.yaml;
    };
    ".hspec" = { source = ./dotfiles/haskell/hspec; };
    ".summoner.toml" = { source = ./dotfiles/haskell/summoner.toml; };
    ".hlint.yaml" = { source = ./dotfiles/haskell/hlint.yaml; };
    ".haskeline" = { source = ./dotfiles/haskell/haskeline; };

    ".cabal" = {
      source = ./dotfiles/haskell/cabal;
      recursive = true;
    };

    ".stack" = {
      source = ./dotfiles/haskell/stack;
      recursive = true;
    };
  };
}
