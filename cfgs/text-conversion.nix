{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ansifilter
    ditaa
    djvu2pdf
    gron
    help2man
    noweb
    pandoc
    par
    pdf2djvu
    pdftk
    plantuml
    scdoc
  ];
}
