{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    docker-machine
    docker_compose
    skopeo
  ];
}
