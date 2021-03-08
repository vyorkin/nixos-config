{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    inputs.home-manager.nixosModules.home-manager

    hardware
    boot
    system
    network
    nix
    nixpkgs
    services
    locale
    x11
    users
    apps
  ];
}
