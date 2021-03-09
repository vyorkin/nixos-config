builtins.listToAttrs (builtins.map (path: {
  name = builtins.head (let
    b = builtins.baseNameOf path;
    m = builtins.match "(.*)\\.nix" b;
  in if isNull m then [ b ] else m);
  value = import path;
}) [
  ./hardware
  ./boot.nix
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
  ./workspace/cursor.nix
  ./workspace/gtk.nix
  ./workspace/gnome
  ./workspace/sway


  ./apps
  ./apps/terminal/alacritty.nix
  ./apps/terminal/kitty.nix
  ./apps/scm/git.nix
  ./apps/shell/zsh.nix
  ./apps/editor/emacs.nix
  ./apps/reading/zathura.nix
  ./apps/web/firefox.nix
  ./apps/web/google-chrome.nix

  ./dev
])
