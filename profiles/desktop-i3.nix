{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./desktop.nix

    x11
    i3
  ];
}
