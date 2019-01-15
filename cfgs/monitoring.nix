{ pkgs, ... }:

{
  programs = {
    mtr.enable = true;
    wireshark = {
      enable = true;
      package = pkgs.wireshark-gtk;
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

    iperf
    nethogs
    nload
    speedtest-cli

    inotify-tools
    multitail
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
