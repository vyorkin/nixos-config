{ pkgs, ... }:

{
  services.openvpn = {
    servers = {
      home = {
        config = ''config /etc/nixos/home/dotsecrets/vpn/home.ovpn'';
	autoStart = false;
        up = "echo nameserver $nameserver | ${pkgs.openresolv}/sbin/resolvconf -m 0 -a $dev";
        down = "${pkgs.openresolv}/sbin/resolvconf -d $dev";
      };
    };
  };
}
