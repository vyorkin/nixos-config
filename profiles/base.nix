{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    inputs.home-manager.nixosModules.home-manager

    hardware
    boot
    system
    network
    nix
    overlay
    nixpkgs
    services
    security
    locale
    home
    users

    git
    zsh
  ];
}
