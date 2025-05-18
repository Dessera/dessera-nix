{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];

    profiles.default = {
      isDefault = true;

      bookmarks = {
        force = true;
        settings = import ./bookmarks.nix;
      };

      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "sidebar.verticalTabs" = true;
        "sidebar.revamp" = true;
        "sidebar.main.tools" = "aichat,syncedtabs,history,bookmarks";
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        plasma-integration
        tabliss
        darkreader
        to-deepl
      ];
    };
  };
}
