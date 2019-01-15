{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    aspellDicts.en-science
    aspellDicts.de
    aspellDicts.fr
    aspellDicts.ru
    tabula
    ttyplot
    visidata
    xurls
  ];
}
