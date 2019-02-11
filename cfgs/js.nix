{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    flow
    nodePackages.bower
    nodePackages.yo
    nodePackages.pulp
    nodePackages.node2nix
    nodePackages.http-server
  # nodePackages.javascript-typescript-langserver
  # nodePackages.flow-language-server
  # nodePackages.typescript-language-server
  # nodePackages.vscode-css-languageserver-bin
  # nodePackages.vscode-html-languageserver-bin
  # nodePackages.vue-language-server
  # nodePackages.bash-language-server
  # nodePackages.ocaml-language-server
  # nodePackages.madge
  # nodePackages.eslint_d
  # nodePackages.import-js
  # nodePackages.how-to-npm
  # nodePackages.psi
  # nodePackages.create-react-app
  # nodePackages.git-issues
  # nodePackages.vtop
  # nodePackages.now
  # nodePackages.pulp
  # nodePackages.pscid
  # nodePackages.spacchetti-cli-bin-simple
  # nodePackages.purp-bin-simple
  # nodePackages.purescript-spago
  # nodePackages.purescript-emmet
  # nodePackages.git-labelmaker
  # nodePackages.json-package
  # nodePackages.svgo
  # nodePackages.prettier
  # nodePackages.jsdoc
  # nodePackages.doiuse
  # nodePackages.localtunnel
  # nodePackages.fixmyjs
  # nodePackages.next-update
  # nodePackages.npm-which
  # nodePackages.npm-quick-run
  # nodePackages.available-versions
  # nodePackages.manpm
  # nodePackages.git-recall
  # nodePackages.sloc
  # nodePackages.jsinspect
  # nodePackages.tmi
  # nodePackages.commitizen
  # nodePackages.iron-node
  # nodePackages.gitbook-cli
  # nodePackages.js-beautify
  # nodePackages.plato
  # nodePackages.solc
  # nodePackages.solium
  # nodePackages.solhint
  ];
}
