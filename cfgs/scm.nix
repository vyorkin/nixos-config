{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cvs
    git
    git-lfs
    git-crypt
    git-sizer
    git-latexdiff
    gitAndTools.hub
    gitAndTools.ghq
    gitAndTools.git-hub
    gitAndTools.git-fame
    gitAndTools.diff-so-fancy
    gitAndTools.git-absorb
    gitAndTools.git-extras
    gitAndTools.git-imerge
    gitAndTools.git-open
    gitAndTools.git-recent
    gitAndTools.git-secret
    gitAndTools.git-secrets
    gitAndTools.gitflow
    gitAndTools.pass-git-helper
    gitinspector
    gitstats
    gibo
    # mercurial
  ];
}
