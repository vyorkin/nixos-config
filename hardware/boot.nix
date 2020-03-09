{
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];
}
