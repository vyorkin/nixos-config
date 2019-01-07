{ config, pkgs, ... }:
 
{
  environment.systemPackages = with pkgs; [
    openvpn
    networkmanager
    networkmanagerapplet
    networkmanager_openvpn
    ssh-agents
    wirelesstools
    afpfs-ng
  ];
 
  networking.networkmanager = {
    enable = true;
    packages = with pkgs; [ networkmanager_openvpn ];
  };
}
