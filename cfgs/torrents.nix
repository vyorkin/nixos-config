{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qbittorrent
    # transmission
    # buildtorrent
  ];
}
