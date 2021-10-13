{
  networking = {
    # The global useDHCP flag is deprecated, therefore
    # explicitly set to false here. Per-interface useDHCP will
    # be mandatory in the future
    useDHCP = false;

    interfaces = {
      enp4s0.useDHCP = true;
    };

    # Samba discovery of machines and shares may need the firewall to be tuned
    firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
