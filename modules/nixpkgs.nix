{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;

    android_sdk.accept_license = true;

    permittedInsecurePackages = [
      "openssl-1.0.2u"
      "p7zip-16.02"
      "python2.7-Pillow-6.2.2"
      "python-2.7.18.6-env"
      "python-2.7.18.6"
      "electron-13.6.9"
    ];
  };
}
