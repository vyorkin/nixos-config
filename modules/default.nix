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
  ./nixpkgs.nix
  ./services.nix
  ./locale

  ./x11
  ./x11/xserver/i3.nix
  ./x11/xserver/libinput.nix

  ./users
  ./apps
])
