# This is vyorkin's configuration file.
# https://github.com/vyorkin/nixos-config
#
# This is the NixOS configuration "entry point".

{ config, pkgs, lib, inputs, ... }:

let host = import ../host.nix;
in rec {
  imports = [
    ./hardware/common.nix
    (./hardware + "/${host.name}")
    ./setup.nix
    inputs.home-manager.nixosModules.home-manager
    ./modules
    ./roles/common.nix
    ./cfgs/users
    ./home
    (./hosts + "/${host.name}")
  ];

  networking.hostName = host.name;
  time.timeZone = host.timeZone;
}
