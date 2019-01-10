{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cabal2nix
    cabal-install
    ghc
    stack
  ];

  services.hoogle = {
    enable = true;
    packages = (hpkgs: with hpkgs; [text cryptonite]);
    haskellPackages = pkgs.haskellPackages;
  };
}
