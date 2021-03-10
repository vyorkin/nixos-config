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
    ag
    fzf
    skim
    fzy
    hstr
  ];
}
