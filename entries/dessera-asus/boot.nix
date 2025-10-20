{ pkgs, ... }:

{
  imports = [
    ../../components/nixos/boot/grub.nix
    ../../components/nixos/boot/plymouth.nix
  ];

  boot = {
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
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
