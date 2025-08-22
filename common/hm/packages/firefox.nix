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
          ublock-origin
        ];
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "书签栏";
            toolbar = true;
            bookmarks = [
              {
                name = "Nix相关";
                bookmarks = [
                  {
                    name = "NixOS 官方 Wiki";
                    tags = [
                      "nix"
                      "wiki"
                    ];
                    url = "https://wiki.nixos.org";
                  }
                  {
                    name = "NixOS 社区 Wiki";
                    tags = [
                      "nix"
                      "wiki"
                    ];
                    url = "https://nixos.wiki";
                  }
                  {
                    name = "Home Manager 选项查询";
                    tags = [
                      "nix"
                      "home-manager"
                    ];
                    url = "https://home-manager-options.extranix.com";
                  }
                  {
                    name = "Nixpkgs Manual";
                    tags = [
                      "nix"
                      "nixpkgs"
                    ];
                    url = "https://ryantm.github.io/nixpkgs/";
                  }
                ];
              }

              {
                name = "吉林大学";
                bookmarks = [
                  {
                    name = "校内OA";
                    tags = [
                      "jlu"
                      "oa"
                    ];
                    url = "https://oa.jlu.edu.cn";
                  }
                  {
                    name = "教学管理系统";
                    tags = [
                      "jlu"
                      "iedu"
                    ];
                    url = "https://iedu.jlu.edu.cn";
                  }
                  {
                    name = "WebVPN";
                    tags = [
                      "jlu"
                      "vpn"
                    ];
                    url = "https://vpn.jlu.edu.cn";
                  }
                  {
                    name = "学习通";
                    tags = [
                      "jlu"
                      "mooc"
                    ];
                    url = "https://i.mooc.chaoxing.com/space/index?t=1726329591465";
                  }
                ];
              }

              {
                name = "计算机";
                bookmarks = [
                  {
                    name = "Linux内核";
                    bookmarks = [
                      {
                        name = "Mirrors";
                        tags = [
                          "mirrors"
                          "kernel"
                          "linux"
                        ];
                        url = "https://mirrors.edge.kernel.org/pub/linux/kernel/";
                      }
                    ];
                  }
                  {
                    name = "csdiy";
                    tags = [
                      "cs"
                      "diy"
                    ];
                    url = "https://csdiy.wiki";
                  }
                  {
                    name = "RFC Editor";
                    tags = [
                      "cs"
                      "network"
                      "rfc"
                    ];
                    url = "https://www.rfc-editor.org/";
                  }
                  {
                    name = "CS144 Labs";
                    tags = [
                      "cs"
                      "network"
                      "lab"
                    ];
                    url = "https://cs144.github.io/";
                  }
                ];
              }

              {
                name = "网络";
                bookmarks = [
                  {
                    name = "万达云";
                    tags = [
                      "vpn"
                    ];
                    url = "https://www.z1z1.top";
                  }
                ];
              }
            ];
          }
        ];
      };
    };
  };
}
