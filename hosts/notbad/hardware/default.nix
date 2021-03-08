{ inputs, ... }:

{
  imports = [
    "${inputs.nixos-hardware}/lenovo/thinkpad/x1/6th-gen"
    "${inputs.nixpkgs}/nixos/modules/installer/scan/not-detected.nix"

    ./fs.nix
    ./power.nix
  ];
}
