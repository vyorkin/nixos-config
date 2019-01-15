{ ... }:

{
  sound.mediaKeys.enable = true;

  services.xserver = {
    displayManager.gdm = {
      enable = true;
    };

    # I use Home Manager to manage X session
  };
}
