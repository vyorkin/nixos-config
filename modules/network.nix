{ pkgs, lib, config, ... }:

{
  networking = {
    # The global useDHCP flag is deprecated, therefore
    # explicitly set to false here. Per-interface useDHCP will
    # be mandatory in the future
    useDHCP = false;

    interfaces = {
      enp4s0.useDHCP = true;
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 13748 13722 5000 22 80 8080 3000 3001 3002 3003 443 51820 ];

      # Samba discovery of machines and shares may need the firewall to be tuned
      extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
    };
  };
}
