{ inputs, ... }: {
  imports = with inputs.self.modules; [
    ./base.nix

    libinput
    i3
  ];
}
