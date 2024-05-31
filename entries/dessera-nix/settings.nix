{ ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  };

  nixpkgs = {
    # hostPlatform = lib.mkDefault "x86_64-linux";
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1w"
      ];
    };
  };

  system.stateVersion = "24.05";
}
