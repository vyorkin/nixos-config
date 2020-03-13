{ pkgs, ... }:

let tdlib = pkgs.callPackage ../pkgs/custom/tdlib { };
in {
  environment.systemPackages = with pkgs; [
    gmp
    pcre
    gperf
    ncurses6
    tdlib
    libwebp
    librsvg
    # For xwidget-webkit in Emacs
    glib-networking
  ];
}
