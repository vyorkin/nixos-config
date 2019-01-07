{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ansible
    ansible-lint
  ];
}
