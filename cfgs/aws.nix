{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    eksctl
    awscli2
  ];
}
