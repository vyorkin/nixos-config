{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aspell
    aspellDicts.en
    aspellDicts.de
    aspellDicts.fr
    aspellDicts.ru
    tabula
    ttyplot
    visidata
    xurls
  ];
}
