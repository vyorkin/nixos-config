{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    k9s
    kubectl
    kubeprompt
    kubecfg
    kind
    kail
    minikube
  ];
}
