{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ansible
    ansible-lint
    drone
    drone-cli
    terraform
    tflint
    terraform-docs
    terraform-providers.aws
    terraform-providers.docker
    terraform-providers.google
    terraform-providers.kubernetes
  ];
}
