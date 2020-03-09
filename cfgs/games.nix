{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Build fails

    # factorio
    # factorio-experimental
    # chocolateDoom

    # Build ok

    dwarf-fortress
    zdoom
    crispyDoom

    # steam
    minecraft
    # https://minecraft.gamepedia.com/Server.properties
    minecraft-server
  ];
}
