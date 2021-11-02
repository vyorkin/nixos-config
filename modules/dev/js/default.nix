{ pkgs, inputs, ... }:

let
  genPkgs = pkgs.callPackage ./packages { inherit inputs; };
  extPkgs = with genPkgs; [
    colorguard
    git-issues
    git-labelmaker
    madge
    psi
    now
    json-package
    localtunnel
    gitbook-cli
    manpm
    available-versions
    git-recall
    jsinspect
    tmi
    commitizen
  ];
  nixPkgs = with pkgs.nodePackages; [
    bower
    yo
    http-server
    eslint_d
    rollup
    svgo
    prettier
    sloc
    js-beautify
    tern
    typescript
    typescript-language-server
  ];
in {
  home-manager.users.vyorkin = {
    home = {
      file = { ".npmrc" = { source = ./npmrc; }; };

      packages = with pkgs;
        [ nodejs_latest yarn flow deno ] ++ nixPkgs ++ extPkgs;
    };
  };
}
