{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.fish;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.fish = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      plugins = [
        # { inherit (pkgs.fishPlugins.pure) name src; }
        { inherit (pkgs.fishPlugins.grc) name src; }
        { inherit (pkgs.fishPlugins.pisces) name src; }
        { inherit (pkgs.fishPlugins.plugin-git) name src; }
        { inherit (pkgs.fishPlugins.sponge) name src; }
      ];
    };

    home.packages = with pkgs; [
      grc
    ];

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      # read from ./prompt.toml
      settings = (lib.importTOML ./prompt.toml);
    };
  };
}
