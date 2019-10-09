{ pkgs, ... }:

let
  my = pkgs.callPackage ./packages { };
  # TODO: 404?
  global1 = with my; [
    purescript-emmet
    # git-issues
    # git-labelmaker
    # madge
    # import-js
    # how-to-npm
    # psi
    # now
    # json-package
    # doiuse
    # localtunnel
    # gitbook-cli
    # manpm
    # available-versions
    # git-recall
    # jsinspect
    # tmi
    # commitizen
    # iron-node
  ];
  global2 = with pkgs.nodePackages; [
    bower
    yo
    pulp
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
    nodejs
    yarn
    flow
  ] ++ global1 ++ global2;
}
