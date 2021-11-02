{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ansible

    drone
    drone-cli

    terraform
    tflint
    terraform-docs
    terraform-lsp
    terraform-providers.aws
    terraform-providers.docker
    terraform-providers.google
    terraform-providers.kubernetes
  ];
}
