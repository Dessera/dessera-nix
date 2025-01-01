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
    sshSupport = mkEnableOption "Enable ssh support for vscode";
    nixcode = {
      nix = mkEnableOption "Enable vscode profile for nix language";
    };
  };

  imports = [
    vscode-server.nixosModules.home
  ];

  config = {
    programs.vscode.enable = cfg.enable;
    services.vscode-server.enable = cfg.sshSupport;

    home.packages = mkIf cfg.nixcode.nix [
      nixcodePkgs.nix
    ];
  };
}
