{
  boot = {
    kernelParams = ["quiet"];

    # All Kernel Messages with a log level smaller
    # than this setting will be printed to the console
    consoleLogLevel = 0;

    # Delete all files in /tmp during boot
    cleanTmpDir = true;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
