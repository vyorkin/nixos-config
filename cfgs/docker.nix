{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    storageDriver = "overlay2";
  };

  environment.systemPackages = with pkgs; [
    docker-machine
    docker_compose
    skopeo
  ];
}
