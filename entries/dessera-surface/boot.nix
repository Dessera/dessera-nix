_:

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
      "nvme"
      "usb_storage"
      "sd_mod"
    ];
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
    };
    plymouth.enable = true;
  };
}
