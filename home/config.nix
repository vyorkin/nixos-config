{
  packageOverrides = super: let self = super.pkgs; in
  {
    myHaskellEnv =
      self.haskellPackages.ghcWithHoogle
        (haskellPackages: with haskellPackages; [
          cabal-install
          happy
          hpack

          dhall
          dhall-json

          styx
        # intero
        # brittany
          hindent
          hlint
          hasktags
          haskdogs
          apply-refact
          present
          alex
          weeder
          ghcid
          cpphs
          dotgen
          fast-tags

          pretty-simple
          pretty-show
          ghci-pretty

          pointfree

        # Agda
        ]);
  };
}
