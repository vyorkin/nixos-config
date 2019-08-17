{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # factorio-experimental
    dwarf-fortress
    # zdoom
    # chocolateDoom
    # crispyDoom
  ];
}
