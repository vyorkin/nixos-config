{ mkDerivation, aeson, base, butcher, bytestring, cmdargs
, containers, czipwith, data-tree-print, deepseq, directory, extra
, fetchgit, filepath, ghc, ghc-boot-th, ghc-exactprint, ghc-paths
, hspec, monad-memo, mtl, multistate, neat-interpolation, parsec
, pretty, random, safe, semigroups, stdenv, strict, syb, text
, transformers, uniplate, unsafe, yaml
}:
mkDerivation {
  pname = "brittany";
  version = "0.12.0.0";
  src = fetchgit {
    url = "https://github.com/lspitzner/brittany.git";
    sha256 = "0j6zkz9pbs7hkjdlrwl4cisnyd4r1fjbxffx41cz5azri79ff0gl";
    rev = "988d5b435390f2391583b09e79304814c35dfd2b";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base butcher bytestring cmdargs containers czipwith
    data-tree-print deepseq directory extra filepath ghc ghc-boot-th
    ghc-exactprint ghc-paths monad-memo mtl multistate
    neat-interpolation pretty random safe semigroups strict syb text
    transformers uniplate unsafe yaml
  ];
  executableHaskellDepends = [
    aeson base butcher bytestring cmdargs containers czipwith
    data-tree-print deepseq directory extra filepath ghc ghc-boot-th
    ghc-exactprint ghc-paths monad-memo mtl multistate
    neat-interpolation pretty safe semigroups strict syb text
    transformers uniplate unsafe yaml
  ];
  testHaskellDepends = [
    aeson base butcher bytestring cmdargs containers czipwith
    data-tree-print deepseq directory extra filepath ghc ghc-boot-th
    ghc-exactprint ghc-paths hspec monad-memo mtl multistate
    neat-interpolation parsec pretty safe semigroups strict syb text
    transformers uniplate unsafe yaml
  ];
  doCheck = false;
  homepage = "https://github.com/lspitzner/brittany/";
  description = "Haskell source code formatter";
  license = stdenv.lib.licenses.agpl3;
}
