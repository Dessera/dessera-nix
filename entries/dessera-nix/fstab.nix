{ ... }:

{
  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/985a0e70-0b4c-41ec-8a25-a18156c8e95b";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/985a0e70-0b4c-41ec-8a25-a18156c8e95b";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/985a0e70-0b4c-41ec-8a25-a18156c8e95b";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/464B-AFC2";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/421178a7-4a6e-4046-a196-b88fd5733d81"; }];

  fileSystems."/data" =
    {
      device = "/dev/disk/by-uuid/131c52bc-ad0e-4195-b321-bf1f4e4f7ec1";
      fsType = "btrfs";
      options = [ "compress=zstd" ];
    };
}
