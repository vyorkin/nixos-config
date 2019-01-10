{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python
    python3
  ];
}
