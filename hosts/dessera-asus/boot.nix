{ pkgs, ... }:

{
  dnix.boot = {
    grub.enable = true;
    plymouth.enable = true;
  };

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "vmd"
      "nvme"
      "usb_storage"
      "sd_mod"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
