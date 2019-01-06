{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mosh
    sshuttle
  ];

  programs.ssh = {
    enable = true;
    compression = true;
  };
}
