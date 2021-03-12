{ inputs, ... }: {
  imports = with inputs.self.nixosModules; [
    ./base.nix

    workspace
    cursor
    gtk
    qt
    gnome
    sway
    virtualisation

    themes

    apps
    tools
    fm
    terminal
    editor
    reading
    messaging
    web
    db
    devops
    monitoring
    media
    streaming
    dev
  ];
}
