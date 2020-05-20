{ ... }:

{
  imports = [
    ../roles/workstation.nix
    ../cfgs/x11/laptop.nix
  ];

  # Configure the governor used to regulate the frequence of the available CPUs
  # for saving battery charge
  powerManagement.cpuFreqGovernor = "powersave";
}
