# Mount points are created automatically if they don’t already exist.
# For device, it’s best to use the topology-independent device aliases in
# /dev/disk/by-label and /dev/disk/by-uuid, as these don’t change if the
# topology changes (e.g. if a disk is moved to another IDE controller).

{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/df39599f-86a7-4790-bdfd-4e152fd1d697";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F8F8-1C09";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/0c77d89d-34a2-4321-8bac-d1fb7d681f7f"; }
    ];
}
