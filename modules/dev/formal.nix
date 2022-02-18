{ pkgs, ... }:

{
  home-manager.users.vyorkin = {
    home.packages = with pkgs; [
      coq
      cvc4
      z3
    ];
  };
}
