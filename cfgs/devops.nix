{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ansible
    ansible-lint
    terraform
    terraform-docs
    terraform-providers.aws
    terraform-providers.docker
    terraform-providers.google
    terraform-providers.kubernetes
  ];
}
