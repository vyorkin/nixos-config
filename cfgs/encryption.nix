{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
    pass
    # tomb
  ];
}
