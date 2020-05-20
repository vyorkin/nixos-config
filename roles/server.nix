{ config, pkgs, ... }:

{
  programs.mosh.enable = true;

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };
}
