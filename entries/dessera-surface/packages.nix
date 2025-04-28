{ pkgs, ... }:

{
  modules.desktop = {
    plasma = {
      enable = true;
      excludePackages = with pkgs.kdePackages; [ xwaylandvideobridge ];
    };
    sddm.enable = true;
  };
}
