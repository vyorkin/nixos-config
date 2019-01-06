{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mosh
    sshuttle
  ];

  programs.ssh = {
    enable = true;
    compression = true;
  };
}
