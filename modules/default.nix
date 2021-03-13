builtins.listToAttrs (builtins.map (path: {
  name = builtins.head (let
    b = builtins.baseNameOf path;
    m = builtins.match "(.*)\\.nix" b;
  in if isNull m then [ b ] else m);
  value = import path;
}) [
  ./hardware
  ./boot
  ./system.nix
  ./network.nix
  ./nix.nix
  ./overlay.nix
  ./nixpkgs.nix
  ./services.nix
  ./locale.nix
  ./security.nix
  ./virtualisation.nix
  ./home.nix
  ./users
  ./themes.nix

  ./x11
  ./x11/xserver/sddm.nix
  ./x11/xserver/i3.nix
  ./x11/xserver/libinput.nix

  ./workspace
  ./workspace/ssh.nix
  ./workspace/cursor.nix
  ./workspace/gtk.nix
  ./workspace/qt.nix
  ./workspace/gnome
  ./workspace/sway

  ./apps
  ./apps/tools
  ./apps/terminal
  ./apps/terminal/alacritty.nix
  ./apps/terminal/kitty.nix
  ./apps/terminal/tmux.nix
  ./apps/fm
  ./apps/scm/git.nix
  ./apps/shell/zsh.nix
  ./apps/shell/fish.nix
  ./apps/editor
  ./apps/editor/emacs.nix
  ./apps/editor/vim.nix
  ./apps/editor/vscode.nix
  ./apps/reading
  ./apps/reading/zathura
  ./apps/messaging
  ./apps/web
  ./apps/web/firefox.nix
  ./apps/web/google-chrome.nix
  ./apps/web/brave.nix
  ./apps/db
  ./apps/devops
  ./apps/monitoring
  ./apps/media
  ./apps/streaming

  ./dev
])
