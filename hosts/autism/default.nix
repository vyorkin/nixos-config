{ inputs, ... }: {
  imports = with inputs.self.modules [
    ./hardware
    ./nix.nix
    ./services.nix

    inputs.self.profiles.desktop
  ];
}
