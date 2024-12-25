{ pkgs, ... }:

{
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
    initrd.availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "vmd"
      "nvme"
      "usb_storage"
      "sd_mod"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "nowatchdog"
      "quiet"
    ];

    tmp.useTmpfs = true;
  };

  modules.boot = {
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
    };
    plymouth.enable = true;
  };
}
