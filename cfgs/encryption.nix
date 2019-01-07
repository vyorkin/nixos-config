{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
    pass
    pass-find
  ];
}
