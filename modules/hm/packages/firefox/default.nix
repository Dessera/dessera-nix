_: _:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.packages.firefox;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.firefox = {
    enable = mkEnableOption "Enable firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      languagePacks = [
        "zh-CN"
        "en-US"
      ];

      profiles.default = {
        bookmarks = import ./bookmarks;

        settings = { };

        extensions = with config.nur.repos.rycee.firefox-addons; [
          # plasma
          plasma-integration

          # privacy
          # ublock-origin

          # look and feel
          tabliss
          darkreader

          # functionality
          to-deepl
        ];
      };
    };
  };
}