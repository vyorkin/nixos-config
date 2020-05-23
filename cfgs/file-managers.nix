{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ranger
    # vifm-full
    # nnn
    # broot
  ];
}
