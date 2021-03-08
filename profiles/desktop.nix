{ inputs, ... }: {
  imports = with inputs.self.modules; [
    ./base.nix

    i3
  ];
}
