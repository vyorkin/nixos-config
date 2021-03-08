{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;

    android_sdk.accept_license = true;
  };
}
