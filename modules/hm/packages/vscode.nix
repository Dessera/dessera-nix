_:
{ vscode-server, nixcode, ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.vscode;
  inherit (lib) mkEnableOption mkIf;
  inherit (pkgs) system;

  nixcodePkgs = nixcode.packages.${system};
in
{
  options.modules.packages.vscode = {
    enable = mkEnableOption "Enable vscode";
    nixcode = {
      nix = mkEnableOption "Enable vscode profile for nix language";
    };
  };

  imports = [
    vscode-server.nixosModules.home
  ];

  config = mkIf cfg.enable {
    programs.vscode.enable = true;
    services.vscode-server.enable = true;

    home.packages = mkIf cfg.nixcode.nix [
      nixcodePkgs.nix
    ];
  };
}
