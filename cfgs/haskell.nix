{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cabal-install
    cabal2nix
    ghc
    stack
  ];

  services.hoogle = {
    enable = true;
    packages = (hpkgs: with hpkgs; [text cryptonite]);
    haskellPackages = pkgs.haskellPackages;
  };
}
