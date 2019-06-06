{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ruby
    bundler
    bundix
  ];
}
