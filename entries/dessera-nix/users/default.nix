{
  inputs,
  pkgs,
  pkgs-master,
  modulesLib,
  ...
}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    extraSpecialArgs = {
      inherit pkgs-master;
      inherit inputs;
    };

    sharedModules = [
      inputs.plasma-manager.homeManagerModules.plasma-manager
      inputs.vscode-server.nixosModules.home
      (modulesLib.mkHmModule { })
    ];

    users = {
      dessera = import ./dessera;
    };
  };

  users = {
    defaultUserShell = pkgs.fish;
    users = {
      dessera = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "video"
          "audio"
        ];
        # openssh.authorizedKeys.keys = [
        #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF8++UjeF0KEWZythCejyUI2P2f4I8XpSIE1KOHwYdiH 1533653159@qq.com"
        # ];
      };
    };
  };
}
