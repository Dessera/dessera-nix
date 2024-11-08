{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.xilinx-dev;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.xilinx-dev = {
    enable = mkEnableOption "Enable udev rules for Xilinx devices";
  };

  config = mkIf cfg.enable {
    services.udev.packages = [
      (pkgs.callPackage ./__packages/xilinx-dilligent-usb-udev.nix { })
      (pkgs.callPackage ./__packages/xilinx-ftdi-usb-udev.nix { })
      (pkgs.callPackage ./__packages/xilinx-pcusb-udev.nix { })
    ];
  };
}
