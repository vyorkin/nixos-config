{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    coq

    pkgs.llvmPackages.openmp
    z3

    cvc4
  ];
}
