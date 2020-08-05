{ pkgs, ... }:

let
  customPkgs = pkgs.callPackage ./packages { };
  custom = with customPkgs; [
    colorguard
    # purescript-emmet
    git-issues
    git-labelmaker
    madge
    # import-js
    # how-to-npm
    psi
    now
    json-package
    # doiuse
    localtunnel
    gitbook-cli
    manpm
    available-versions
    git-recall
    jsinspect
    tmi
    commitizen
    # iron-node
  ];
  nixpkgs = with pkgs.nodePackages; [
    bower
    yo
    # pulp
    http-server
    javascript-typescript-langserver
    typescript-language-server
    vscode-css-languageserver-bin
    vscode-html-languageserver-bin
    vue-language-server
    bash-language-server
    ocaml-language-server
    eslint_d
    create-react-app
    svgo
    prettier
    # jsdoc
    sloc
    js-beautify
    tern
  ];
in {
  environment.systemPackages = with pkgs; [
    nodejs-14_x
    yarn
    flow
  ] ++ custom ++ nixpkgs;
}
