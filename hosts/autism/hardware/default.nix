{ inputs, ... }:

{
  imports = [
    "${inputs.nixpkgs}/nixos/modules/installer/scan/not-detected.nix"
    "${inputs.nixos-hardware}/common/cpu/amd"
    "${inputs.nixos-hardware}/common/pc"
    # Enable fstrim
    "${inputs.nixos-hardware}/common/pc/ssd"

    ./boot.nix
    ./fs.nix
    ./power.nix
    ./video.nix
  ];
}
