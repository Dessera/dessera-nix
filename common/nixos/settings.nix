_:

{
  nix = {
    settings = {
      auto-optimise-store = true;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
      ];

      trusted-users = [
        "root"
        "dessera"
      ];
    };

    optimise.automatic = true;
    gc.automatic = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-30.5.1"
      ];
    };
  };
}
