{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./base.nix

    workspace
    cursor
    gtk
    gnome
    sway
    virtualisation

    themes

    apps
    alacritty
    emacs
    zathura
    firefox
    google-chrome

    dev
  ];
}
