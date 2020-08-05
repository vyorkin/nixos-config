{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go
    dep
    dep2nix
    glide
    vgo2nix

    deadcode
    errcheck
    go-langserver
    go-tools
    gocode-gomod
    goconst
    goconvey
    gocyclo
    godef
    gogetdoc
    golint
    golangci-lint
    gomodifytags
    gosec
    gotags
    gotools
    govers
    iferr
    impl
    ineffassign
    interfacer
    maligned
    manul
    reftools
    unconvert
    go-check
  ];
}
