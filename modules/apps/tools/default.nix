{ pkgs, ... }:

{
  imports = [
    ./base.nix
    ./nix.nix
    ./search.nix
    ./screencasting.nix
    ./compression.nix
    ./http.nix
    ./websocket.nix
    ./json.nix
    ./url.nix
    ./disk.nix
    ./network.nix
    ./aws.nix
    ./media.nix
    ./blogging.nix
    ./finance.nix
    ./raspberry.nix
  ];
}
