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
    # TODO: Use the latest kernel when nvidia drivers are ready for 6.12
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_6_11;
    kernelParams = [
      "nowatchdog"
      "quiet"
    ];
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
