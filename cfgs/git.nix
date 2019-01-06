{ pkgs, ... }:

{
  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Vasiliy Yorkin";
    userEmail = "vasiliy.yorkin@gmail.com";
  };
}
