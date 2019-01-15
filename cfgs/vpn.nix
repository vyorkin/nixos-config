{ pkgs, ... }:

let
  openvpnReconnect = pkgs.callPackage ../pkgs/openvpn-reconnect {};
in
  {
    environment.systemPackages = [ openvpnReconnect ];

    services.openvpn = {
      servers = {
        home = {
          config = ''config /etc/nixos/home/dotsecrets/vpn/home.ovpn'';
          autoStart = true;
          updateResolvConf = true;
        };
      };
    };
  }
