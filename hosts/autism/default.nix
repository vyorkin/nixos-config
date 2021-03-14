{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./hardware
    ./nix.nix
    ./services.nix

    inputs.self.nixosProfiles.desktop

    streaming
    pentest
  ];

  location = {
    latitude = 55.7558;
    longitude = 37.6173;
  };
}
