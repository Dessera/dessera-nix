{ pkgs, ... }:

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
    # kernelModules = [ "kvm-intel" ];
    # TODO: Use the latest kernel when nvidia drivers are ready for 6.12
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.linuxPackages_6_11;
    kernelParams = [
      "nowatchdog"
      "quiet"
      # "nvidia-drm.modeset=1"
    ];
  };
}
