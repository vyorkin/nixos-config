{ pkgs, ... }:

let tdlib = pkgs.callPackage ../pkgs/custom/tdlib { };
in {
  environment.systemPackages = with pkgs; [
    gmp
    pcre
    gperf
    ncurses
    # ncurses6
    # tdlib
    libwebp
    librsvg
    libusb
    libtool
    texinfo
    glib
    # For xwidget-webkit in Emacs
    glib-networking
    gobject-introspection
  ];
}
