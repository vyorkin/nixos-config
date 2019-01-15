{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neomutt
  ];
}
