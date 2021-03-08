{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./base.nix

    i3
  ];
}
