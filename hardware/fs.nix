{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f4e7920d-0da2-44f4-a03c-009e6b59534d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9141-2F0D";
    fsType = "vfat";
  };

  swapDevices = [];
}
