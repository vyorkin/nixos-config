{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a6ba74ef-81da-4451-a84f-5f09c43c0440";
      fsType = "ext4";
    };

   fileSystems."/boot" = {
     device = "/dev/disk/by-uuid/9141-2F0D";
     fsType = "vfat";
   };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/8395f868-dda9-4a3a-865c-055357cd2656"; }
    ];
}
