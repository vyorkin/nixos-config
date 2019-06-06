{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clisp
    sbcl
    lispPackages.quicklisp

    cfr
    clojure
    leiningen
  ];
}
