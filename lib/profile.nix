{ inputs, lib }:

{
  mkProfile =
    {
      name,
      system,
      modules ? [ ],
      homeModules ? [ ],
      backupFileExtension ? "bkp",
    }:
    let
      specialArgs = { inherit inputs lib; };

      osEssentials = with inputs; [
        home-manager.nixosModules.home-manager
        nur.modules.nixos.default
        stylix.nixosModules.stylix
        catppuccin.nixosModules.catppuccin
      ];

      homeEssentials = with inputs; [
        vscode-server.homeModules.default
        plasma-manager.homeModules.plasma-manager
        catppuccin.homeModules.catppuccin
      ];
    in
    lib.nixosSystem {
      inherit system specialArgs;
      modules = [
        {
          networking.hostName = name;

          nixpkgs.overlays = with inputs; [
            nix-vscode-extensions.overlays.default
          ];

          home-manager = {
            inherit backupFileExtension;
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = homeEssentials ++ homeModules;
          };
        }
      ]
      ++ osEssentials
      ++ modules;
    };

  mkUser =
    {
      username,
      name,
      email,
      shell,
      groups ? [ ],
      modules ? [ ],
      home ? "/home/${username}",
      isNormalUser ? true,
    }@user:
    {
      users.users.${username} = {
        inherit shell home isNormalUser;

        name = username;
        description = name;
        extraGroups = groups;
      };

      home-manager.users.${username} = {
        imports = [
          {
            home = {
              inherit username;
              homeDirectory = home;
            };

            _module.args = {
              inherit user;
            };
          }
        ]
        ++ modules;
      };
    };
}
