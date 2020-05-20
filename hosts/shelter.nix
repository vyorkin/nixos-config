{ ... }:

{
  imports = [
    ../roles/server.nix
    ../roles/workstation.nix
  ];

  # Configure the governor used to regulate the frequence of the available CPUs
  # for maximum performance
  powerManagement.cpuFreqGovernor = "performance";
}
