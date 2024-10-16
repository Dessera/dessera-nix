{ pkgs, ... }:

let
  qtTheme = pkgs.catppuccin-kvantum.override {
    accent = "Flamingo";
    variant = "Mocha";
  };
in
{
  qt = {
    enable = true;
    platformTheme = {
      name = "qtct";
    };
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/Catppuccino-Mocha-Flamingo".source = "${qtTheme}/share/Kvantum/Catppuccin-Mocha-Flamingo";
    "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=Catppuccino-Mocha-Flamingo";
  };
}
