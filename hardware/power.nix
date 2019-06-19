{ lib, ... }:

{
  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkDefault "powersave";
    powertop.enable = true;
  };

  services = {
    upower.enable = true;
    acpid.enable = true;

    # logind.lidSwitch = "ignore";

    tlp = {
      enable = true;
      extraConfig = ''
        USB_AUTOSUSPEND=0
        USB_BLACKLIST_BTUSB=1
      '';
    };
  };
}
