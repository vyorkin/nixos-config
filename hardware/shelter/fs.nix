{
  # Mount points are created automatically if they don’t already exist.
  # For device, it’s best to use the topology-independent device aliases in
  # /dev/disk/by-label and /dev/disk/by-uuid, as these don’t change if the
  # topology changes (e.g. if a disk is moved to another IDE controller).

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

    "/external-ro" = {
      device = "/dev/disk/by-label/hdd-1";

      # System startup will fail if any of the filesystems fails to
      # mount, dropping you to the emergency shell.
      # We want make a mount of the external hdd asynchronous and non-critical.
      options = [ "nofail" ];
    };
  };

  swapDevices = [];
}
