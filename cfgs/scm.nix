{ pkgs, ... }:

{
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Vasiliy Yorkin";
    userEmail = "vasiliy.yorkin@gmail.com";
  };

  environment.systemPackages = with pkgs; [
    git-crypt
    git-lfs

    gitAndTools.git-hub
    gitAndTools.hub
    gitAndTools.git-fame
  ];
}
