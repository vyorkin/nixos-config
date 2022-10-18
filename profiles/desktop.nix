{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./base.nix

    themes
    workspace
    ssh
    cursor
    gtk
    # qt
    gnome

    # lightdm
    sddm

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
