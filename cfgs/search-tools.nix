{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
