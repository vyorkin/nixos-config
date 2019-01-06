{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mosh
    sshuttle
  ];
}
