{ pkgs, ... }:

{
  services.openvpn = {
    servers = {
      home = {
        config = ''config /etc/nixos/home/dotsecrets/vpn/home.ovpn'';
	autoStart = false;
	updateResolvConf = true;
      };
    };
  };
}
