{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./base.nix

    workspace
    ssh
    cursor
    gtk
    qt
    gnome

    x11
    lightdm
    i3

    virtualisation

    apps
    tools
    fm
    terminal
    editor
    reading
    messaging
    web
    torrent
    db
    devops
    monitoring
    media
    dev
  ];
}
