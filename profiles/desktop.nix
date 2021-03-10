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

    kitty
    alacritty
    tmux

    emacs
    vim

    zathura
    firefox
    google-chrome

    dev
  ];
}
