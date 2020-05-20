{
  boot = {
    kernelParams = ["quiet"];

    # All Kernel Messages with a log level smaller
    # than this setting will be printed to the console
    consoleLogLevel = 3;

    # Delete all files in /tmp during boot
    cleanTmpDir = true;

    loader = {
      grub.enable = true;
      grub.version = 2;
      grub.device = "/dev/sda"; # or "nodev" for efi only
    };
  };
}
