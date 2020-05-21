{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    "${inputs.nixpkgs}/nixos/modules/installer/scan/not-detected.nix"
    "${inputs.nixos-hardware}/common/cpu/amd"
    "${inputs.nixos-hardware}/common/pc"
    # Enables fstrim
    "${inputs.nixos-hardware}/common/pc/ssd"

    ./boot.nix
    ./fs.nix
    ./power.nix
  ];

  # Maximum number of jobs that Nix will try to build in parallel.
  # Set to the total number of logical cores in the system
  nix.maxJobs = lib.mkDefault 12;
}
