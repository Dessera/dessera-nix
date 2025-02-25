{ pkgs, ... }:

{
  modules.packages = {
    podman = {
      enable = true;
      enableNvidiaSupport = true;
    };
  };

  modules.desktop = {
    plasma = {
      enable = true;
      excludePackages = with pkgs.kdePackages; [ xwaylandvideobridge ];
    };
    sddm.enable = true;
  };

  environment.systemPackages = with pkgs; [
    qemu_full
  ];
}
