{ pkgs, lib, config, ... }:

let
  localRanges = [
    { from = 1714; to = 1764; } # KDE connect
  ];
in {
  networking = {
    networkmanager.enable = true;

    # The global useDHCP flag is deprecated, therefore
    # explicitly set to false here. Per-interface useDHCP will
    # be mandatory in the future
    useDHCP = false;

    interfaces = {
      enp4s0.useDHCP = true;
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 13748 13722 5000 22 80 443 51820 ];

      interfaces.wlan0.allowedTCPPortRanges = localRanges;
      interfaces.wlan0.allowedUDPPortRanges = localRanges;
      interfaces.eth0.allowedUDPPortRanges = localRanges;
      interfaces.eth0.allowedTCPPortRanges = localRanges;

      # Samba discovery of machines and shares may need the firewall to be tuned
      extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';
    };

    resolvconf.extraConfig = ''
      local_nameservers=""
      name_server_blacklist="0.0.0.0 127.0.0.1"
      resolv_conf_local_only=NO
    '';
    usePredictableInterfaceNames = false;

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
