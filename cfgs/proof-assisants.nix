{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    coq
  ];
}
