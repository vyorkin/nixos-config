{ lib, ... }:

{
  powerManagement = {
    enable = true;
    # cpuFreqGovernor = lib.mkDefault "powersave";
    # powertop.enable = true;
  };

  services = {
    upower.enable = true;
    acpid.enable = true;
  };
}
