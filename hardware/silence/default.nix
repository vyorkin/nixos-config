{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    "${inputs.nixos-hardware}/lenovo/thinkpad/x1/6th-gen"
    "${inputs.nixpkgs}/nixos/modules/installer/scan/not-detected.nix"

    ./boot.nix
    ./fs.nix
    ./power.nix
  ];

  # Maximum number of jobs that Nix will try to build in parallel.
  # Set to the total number of logical cores in the system
  nix.maxJobs = lib.mkDefault 8;
}
