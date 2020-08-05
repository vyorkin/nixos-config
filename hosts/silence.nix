{ ... }:

{
  imports = [
    ../roles/workstation.nix
    ../cfgs/x11/laptop.nix
    ../cfgs/bluetooth.nix
  ];
}
