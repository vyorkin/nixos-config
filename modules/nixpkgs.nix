{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;

    android_sdk.accept_license = true;

    permittedInsecurePackages = [
      "openssl-1.0.2u"
      "p7zip-16.02"
    ];
  };
}
