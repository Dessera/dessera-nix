{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];

    profiles.default = {
      isDefault = true;

      settings = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "sidebar.verticalTabs" = true;
        "sidebar.revamp" = true;
        "sidebar.main.tools" = "aichat,syncedtabs,history,bookmarks";
      };

      search = {
        force = true;
        default = "bing";
        privateDefault = "google";

        engines = {
          nix-packages = {
            name = "Nix Packages (Unstable)";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };
        };
      };

      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          plasma-integration
          tabliss
          darkreader
          to-deepl
        ];
      };

      bookmarks = import ./bookmarks.nix;
    };
  };
}
