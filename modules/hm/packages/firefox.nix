{
  nur,
  firefox-nightly,
  mlib,
  meta,
  ...
}:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.firefox;
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;

  firefoxLang = lib.replaceStrings [ "_" ] [ "-" ] (
    lib.lists.head (lib.splitString "." (meta.locale.language))
  );

  nurPkgs = mlib.wrapNUR { inherit nur pkgs; };
  nightlyPkg = firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin;
in
{
  imports = [
    # (mlib.mkAliasOptionModule
    #   [
    #     "modules"
    #     "packages"
    #     "firefox"
    #     "bookmarks"
    #   ]
    #   [
    #     "programs"
    #     "firefox"
    #     "profiles"
    #     "default"
    #     "bookmarks"
    #     "settings"
    #   ]
    # )
  ];

  options.modules.packages.firefox = {
    enable = mkEnableOption "Enable firefox";
    useNightly = mkEnableOption "Use nightly version of firefox";
    bookmarks = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
      description = "Bookmarks to add to firefox";
    };
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = mkIf cfg.useNightly nightlyPkg;
      languagePacks = [ firefoxLang ];

      profiles.default = {
        isDefault = true;

        bookmarks = {
          force = true;
          settings = cfg.bookmarks;
        };

        settings = {
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "sidebar.verticalTabs" = true;
          "sidebar.revamp" = true;
          "sidebar.main.tools" = "aichat,syncedtabs,history,bookmarks";
        };

        extensions.packages = with nurPkgs.repos.rycee.firefox-addons; [
          plasma-integration
          # ublock-origin
          tabliss
          darkreader
          to-deepl
        ];
      };
    };
  };
}
