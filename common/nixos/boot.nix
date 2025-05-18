{ ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
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
    kernelParams = [
      "nowatchdog"
      "quiet"
    ];
  };

  catppuccin.grub.enable = true;

  boot.plymouth.enable = true;
  catppuccin.plymouth.enable = true;
}
