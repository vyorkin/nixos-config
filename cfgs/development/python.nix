{ pkgs, ... }:


with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    keyring
    python-language-server
    virtualenv
    virtualenvwrapper
  ];
in
  {
    environment.systemPackages = with pkgs; [
      python
      (python3.withPackages my-python-packages)
    ];
  }
