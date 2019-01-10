{
  packageOverrides = super: let self = super.pkgs; in
  {
    myHaskellEnv =
      self.haskellPackages.ghcWithHoogle
        (haskellPackages: with haskellPackages; [
          cabal-install
          alex
	  happy
          hpack
          dhall
	  dhall-json
          styx
        # intero
        # brittany
          hlint
          hasktags
          haskdogs
          apply-refact
          present
          weeder
	  ghcid
	  cpphs
	  dotgen
	  fast-tags
        ]);
  };
}

