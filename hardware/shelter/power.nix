{ ... }:

{
  powerManagement = {
    enable = true;

    # Configure the governor used to regulate the frequence of the available CPUs
    # for saving battery charge
    cpuFreqGovernor = "powersave";
  };
}
