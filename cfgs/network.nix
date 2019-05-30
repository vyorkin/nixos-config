{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openvpn
    networkmanager
    networkmanagerapplet
    ssh-agents
  ];

  systemd.services.dhcpcd.serviceConfig.Type = lib.mkForce "simple";

  networking.networkmanager = {
    enable = true;
    # packages = with pkgs; [ networkmanager_openvpn ];
  };
}
