{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # factorio-experimental
    dwarf-fortress
    # zdoom
    # chocolateDoom
    # crispyDoom

    steam
    minecraft
    # https://minecraft.gamepedia.com/Server.properties
    minecraft-server
  ];
}
