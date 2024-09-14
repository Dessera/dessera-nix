{ config, lib, pkgs, ... }:

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
      enableGnomeExtensions = true;

      profiles.default = {
        bookmarks = [
          {
            name = "书签栏";
            toolbar = true;
            bookmarks = [
              {
                name = "Nix相关";
                bookmarks = [
                  {
                    name = "NixOS 官方 Wiki";
                    tags = [ "nix" "wiki" ];
                    url = "https://wiki.nixos.org";
                  }
                  {
                    name = "NixOS 社区 Wiki";
                    tags = [ "nix" "wiki" ];
                    url = "https://nixos.wiki";
                  }
                ];
              }
              {
                name = "吉林大学";
                bookmarks = [
                  {
                    name = "校内OA";
                    tags = [ "jlu" "oa" ];
                    url = "https://oa.jlu.edu.cn";
                  }
                  {
                    name = "教学管理系统";
                    tags = [ "jlu" "iedu" ];
                    url = "https://iedu.jlu.edu.cn";
                  }
                  {
                    name = "WebVPN";
                    tags = [ "jlu" "vpn" ];
                    url = "https://vpn.jlu.edu.cn";
                  }
                  {
                    name = "学习通";
                    tags = [ "jlu" "mooc" ];
                    url = "https://i.mooc.chaoxing.com/space/index?t=1726329591465";
                  }
                ];
              }
              {
                name = "计算机";
                bookmarks = [
                  {
                    name = "csdiy";
                    tags = [ "cs" "diy" ];
                    url = "https://csdiy.wiki";
                  }
                ];
              }
              {
                name = "网络";
                bookmarks = [
                  {
                    name = "ORG";
                    tags = [ "org" "vpn" ];
                    url = "https://orgcloud.cc";
                  }
                ];
              }
            ];
          }
        ];

        # TODO: TOO MANY OPTIONS TO LIST, WILL BE MODIFIED LATER
        settings = {
          "font.language.group" = "zh-CN";
          "intl.locale.requested" = "zh-CN, en-US";
          "intl.accept_languages" = "zh-CN, en-US";
        };
      };
    };
  };
}
