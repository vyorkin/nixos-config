{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clisp
    sbcl

    cfr
    clojure
    leiningen
  ];
}
