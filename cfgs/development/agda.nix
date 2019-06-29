{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [AgdaStdlib];
  environment.pathsToLink = ["/share/agda"];
}
