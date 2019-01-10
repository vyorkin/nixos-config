{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    purescript
    psc-package
  ];
}
