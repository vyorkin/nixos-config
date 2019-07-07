{ mkDerivation, base, containers, fetchgit, gomp, hspec, QuickCheck
, stdenv, transformers, z3
}:
mkDerivation {
  pname = "z3";
  version = "408.0";
  src = fetchgit {
    url = "https://github.com/IagoAbal/haskell-z3.git";
    sha256 = "1781p4pgzxg945j1669q6sfg58g7b8rqvvnzh2fd821qgj7451qf";
    rev = "b10e09b8a809fb5bbbb1ef86aeb62109ece99cae";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ base containers transformers ];
  librarySystemDepends = [ gomp z3 ];
  testHaskellDepends = [ base hspec QuickCheck ];
  homepage = "https://github.com/IagoAbal/haskell-z3";
  description = "Bindings for the Z3 Theorem Prover";
  license = stdenv.lib.licenses.bsd3;
}
