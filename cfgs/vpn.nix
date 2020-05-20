{ pkgs, inputs, ... }:

let
  openvpnReconnect = pkgs.callPackage ../pkgs/custom/openvpn-reconnect { };
in
  {
    # environment.systemPackages = [ openvpnReconnect ];

    services.openvpn = {
      servers = {
        home = {
          config = "config ${inputs.secrets}/vpn/home.ovpn";
          autoStart = true;
          updateResolvConf = true;
        };
      };
    };
  }
