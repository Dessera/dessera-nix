{ inputs, ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.nur.overlay
    ];
  };

  hardware.asus.battery = {
    chargeUpto = 80;
    enableChargeUptoScript = true;
  };

  system.stateVersion = "24.05";
}
