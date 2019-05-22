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

  environment.systemPackages = with pkgs; [
    htop
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

    iperf
    nethogs
    nload
    speedtest-cli

    inotify-tools
    multitail
    lnav
    ntfy
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
