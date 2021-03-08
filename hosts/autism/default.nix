{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./hardware
    ./nix.nix
    ./services.nix

    inputs.self.nixosProfiles.desktop
  ];
}
