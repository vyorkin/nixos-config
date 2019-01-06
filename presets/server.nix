{ config, pkgs, ... }:

{
  boot.cleanTmpDir = true;

  networking.firewall.allowPing = true;

  programs.mosh.enable = true;

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };
}
