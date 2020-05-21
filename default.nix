# This is vyorkin's configuration file.
# https://github.com/vyorkin/nixos-config
#
# This is the NixOS configuration "entry point".

{ config, pkgs, lib, inputs, name, ... }:
rec {
  imports = [
    ./hardware/common.nix
    (./hardware + "/${name}")
    (import ./setup.nix name)
    inputs.home-manager.nixosModules.home-manager
    ./modules
    ./roles/common.nix
    ./cfgs/users
    ./home
    (./hosts + "/${name}.nix")
  ];

  host = name;
}
