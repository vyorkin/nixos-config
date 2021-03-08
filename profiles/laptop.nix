{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./base.nix

    libinput
    i3
  ];
}
