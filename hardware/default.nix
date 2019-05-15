{ config, lib, pkgs, ... }:

{
  imports = [
    <nixos-hardware/lenovo/thinkpad/x1/6th-gen>
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ./boot.nix
    ./fs.nix
    ./power.nix
  ];

  nix.maxJobs = lib.mkDefault 8;
}
