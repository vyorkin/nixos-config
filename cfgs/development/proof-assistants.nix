{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    coq
    z3
  ];
}
