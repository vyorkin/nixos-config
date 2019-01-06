{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git-crypt
    git-lfs

    gitAndTools.git-hub
    gitAndTools.hub
    gitAndTools.git-fame
  ];
}
