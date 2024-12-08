_:
{ vscode-server, ... }:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.packages.vscode;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.vscode = {
    enable = mkEnableOption "Enable vscode";
  };

  imports = [
    vscode-server.nixosModules.home
  ];

  config = mkIf cfg.enable {
    programs.vscode.enable = true;
    services.vscode-server.enable = true;
  };
}
