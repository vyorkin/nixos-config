{ pkgs, ... }:


with pkgs;
let
  p2-packages = python-packages: with python-packages; [
    pyserial
  ];
  p3-packages = python-packages: with python-packages; [
    keyring
    python-language-server
    virtualenv
    virtualenvwrapper

    pyserial

    # Terminal based YouTube player and downloader
    mps-youtube

    # glances
    # howdoi

    sphinx
  ];
in
  {
    environment.systemPackages = with pkgs; [
      (python.withPackages p2-packages)
      (python3.withPackages p3-packages)
    ];
  }
