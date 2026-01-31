{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1bc3506a-b5d6-4ef5-9570-001fc0694e01";
    fsType = "btrfs";
    options = [
      "subvol=@"
      "compress=zstd"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/1bc3506a-b5d6-4ef5-9570-001fc0694e01";
    fsType = "btrfs";
    options = [
      "subvol=@home"
      "compress=zstd"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/1bc3506a-b5d6-4ef5-9570-001fc0694e01";
    fsType = "btrfs";
    options = [
      "subvol=@nix"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C027-487E";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/e4d6d585-c215-499a-9cd1-8a496119ed33"; }
  ];

  fileSystems."/run/media/dessera/DATA" = {
    device = "/dev/disk/by-uuid/131c52bc-ad0e-4195-b321-bf1f4e4f7ec1";
    fsType = "btrfs";
    options = [ "compress=zstd" ];
  };
}
