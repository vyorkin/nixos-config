# Mount points are created automatically if they don’t already exist.
# For device, it’s best to use the topology-independent device aliases in
# /dev/disk/by-label and /dev/disk/by-uuid, as these don’t change if the
# topology changes (e.g. if a disk is moved to another IDE controller).

{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/50ee6242-7f53-4700-ba3b-c8871fbf82c3";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/47A6-14D0";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/b6550012-e5ff-474c-bf4a-d9f6b35cab9f"; }
    ];
}
