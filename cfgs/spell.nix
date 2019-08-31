{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hunspell
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    aspellDicts.de
    aspellDicts.fr
    aspellDicts.ru
    tabula
    ttyplot
    xurls

    wordnet
    sdcv

    translate-shell
  ];
}
