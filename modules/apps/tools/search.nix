{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Replacement for 'ls' written in Rust
    exa

    fd
    findutils
    rdfind
    ack
    ripgrep
    silver-searcher
    fzf
    skim
    fzy
    hstr
  ];
}
