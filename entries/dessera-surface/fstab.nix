{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e3bea3d6-ab78-4299-9af9-a574de88eff1";
    fsType = "btrfs";
    options = [
      "subvol=@"
      "compress=zstd"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/e3bea3d6-ab78-4299-9af9-a574de88eff1";
    fsType = "btrfs";
    options = [
      "subvol=@home"
      "compress=zstd"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/e3bea3d6-ab78-4299-9af9-a574de88eff1";
    fsType = "btrfs";
    options = [
      "subvol=@nix"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/47F7-17CC";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/58338bec-75af-43f6-b6ed-a8eb57e3e414"; }
  ];

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/7812d738-88e9-49cf-be42-bc59baf15a94";
    fsType = "btrfs";
    options = [
      "subvol=@"
      "compress=zstd"
    ];
  };
}
