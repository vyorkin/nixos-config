{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [agda agda-pkg];
  # environment.pathsToLink = ["/share/agda"];
}
