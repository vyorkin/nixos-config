{ lib, ... }:

{
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
