{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ nyxt ];
}
