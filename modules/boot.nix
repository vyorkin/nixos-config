{ pkgs, ... }:

{
  boot = {
    loader = {
      # Use the systemd-boot EFI boot loader
      systemd-boot.enable = pkgs.system == "x86_64-linux";

      efi.canTouchEfiVariables = true;

      # Automatically add other operating system to the grub menu
      grub.useOSProber = true;
    };

    # Delete all files in /tmp during boot
    cleanTmpDir = true;

    # Use the latest Linux kernel packages
    kernelPackages = pkgs.linuxPackages_latest;

    # quite - Don't show terminal output unless an error occurs
    # splash - Show splash screen theme (if available)
    # pti on/off - Enable/disable Page Table Isolation (PTI).
    #              Protects from attacks on the shared user/kernel address space,
    #              but with a cost of a little perfomance overhead
    kernelParams = ["quiet" "splash"];

    # All Kernel Messages with a log level smaller
    # than this setting will be printed to the console
    consoleLogLevel = 3;

    # Lower the balance between swapping applications and
    # freeing cache. At 100, the kernel will always prefer to
    # find inactive pages and swap them out. Default is 60
    kernel.sysctl."vm.swappiness" = 20;

    # Enable all functions of sysrq. It is a magical key combo
    # you can hit which the kernel will respond to regardless of
    # whatever else it is doing, unless it is completely locked up.
    # On x86: ALT+PSc/SRq+<command key>
    kernel.sysctl."kernel/sysrq" = 1;
  };
}
