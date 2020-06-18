{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (agda.withPackages [ agdaPackages.standard-library ])
    agda-pkg
  ];
}
