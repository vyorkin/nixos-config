{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./hardware
    ./nix.nix
    ./services.nix

    inputs.self.nixosProfiles.desktop-i3

    streaming
    pentest
    # gaming
  ];

  location = {
    latitude = 55.7558;
    longitude = 37.6173;
  };
}
