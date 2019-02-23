{ pkgs, ... }:


with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    python-language-server
  ];
in
  {
    environment.systemPackages = with pkgs; [
      python
      (python3.withPackages my-python-packages)
    ];
  }
