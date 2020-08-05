{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ansifilter
    ditaa
    gron
    help2man
    # noweb
    pandoc
    par
    djvu2pdf
    pdf2djvu
    pdftk
    plantuml
    scdoc
    odt2txt

    # GhostScript viewer
    gv

    # xpdf (insecure)

    poppler
    mupdf

    # calibre
    djview
    djvulibre
    ghostscript
    zathura
    # polar-bookshelf
  ];
}
