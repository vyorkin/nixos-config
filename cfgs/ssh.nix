{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mosh
    sshuttle
    ssh-audit
  ];
}
