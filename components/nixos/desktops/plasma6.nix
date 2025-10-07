{ pkgs, ... }:

{
  imports = [
    ../greeters/sddm.nix
  ];

  services.desktopManager.plasma6.enable = true;

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      xwaylandvideobridge
      konsole
    ];
  };
}
