{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openvpn
    networkmanager
    networkmanagerapplet
    ssh-agents
  ];

  networking.networkmanager = {
    enable = true;
    # packages = with pkgs; [ networkmanager_openvpn ];
  };
}
