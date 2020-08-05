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

    "/files" = {
      device = "/dev/disk/by-uuid/d328606c-697d-45b1-bee8-fa9005e9534f";
      fsType = "ext4";
    };
  };

  swapDevices = [];
}
