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
            name = "Nix相关";
            toolbar = true;
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
        ];

        # TODO: TOO MANY OPTIONS TO LIST, WILL BE MODIFIED LATER
        # settings = { };
      };
    };
  };
}
