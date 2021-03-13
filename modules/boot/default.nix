{ lib, pkgs, ... }:

let angular_plymouth_theme = pkgs.callPackage ./plymouth/angular.nix { };
in {
  boot = {
    loader = {
      # Use the systemd-boot EFI boot loader
      systemd-boot.enable = pkgs.system == "x86_64-linux";

      efi.canTouchEfiVariables = true;

      grub = {
        # Disable the GNU GRUB boot loader.
        enable = lib.mkForce false;
        # Automatically add other operating system to the grub menu
        useOSProber = true;
      };
    };

    # Enable plymouth boot splash screen
    plymouth = {
      enable = true;
      theme = "angular";
      themePackages = [ angular_plymouth_theme ];
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
    kernelParams = [ "quiet" "splash" ];

    # All Kernel Messages with a log level smaller
    # than this setting will be printed to the console
    consoleLogLevel = 3;

    kernel = {
      # Enable all functions of sysrq. It is a magical key combo
      # you can hit which the kernel will respond to regardless of
      # whatever else it is doing, unless it is completely locked up.
      # On x86: ALT+PSc/SRq+<command key>
      sysctl."kernel/sysrq" = 1;
    };
  };
}
