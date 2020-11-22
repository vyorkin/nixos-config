{ pkgs, ... }:

{
  programs = {
    mtr.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark-qt;
    };
    wavemon.enable = true;
  };

  services = {
    prometheus = {
      enable = true;
    };

    # loki = {
    #   enable = true;
    #   dataDir = "/var/lib/loki";
    # };

    grafana = {
      enable = true;
      port = 3033;
      domain = "localhost";
      protocol = "http";
      dataDir = "/var/lib/grafana";
    };
  };

  environment.systemPackages = with pkgs; [
    htop
    # ytop
    gotop
    iotop
    ctop
    lsof
    diskus
    duc
    pscircle
    psmisc
    smem
    dnsutils

    ltrace
    dstat
    sysstat
    linuxPackages.perf
    linuxPackages.systemtap
    pcstat
    iperf
    tiptop
    nethogs
    nload
    tcpdump
    # iptraf
    speedtest-cli
    fast-cli

    inotify-tools
    multitail
    lnav
    # ntfy
    pv
    reflex
    up
    watchexec

    conky
    neofetch
    glogg

    cointop
  ];
}
