{ generalTheme, ... }:

{
  enable = true;
  workspace = {
    wallpaper = ./background.png;
    lookAndFeel = generalTheme.theme.plasma.lookAndFeel;
    colorScheme = generalTheme.theme.plasma.colorScheme;
    cursor = {
      theme = generalTheme.cursor.name;
      size = generalTheme.cursor.size;
    };
    iconTheme = generalTheme.icon.name;
  };
  kscreenlocker = {
    appearance.wallpaper = ./background.png;
  };
  panels = [
    (import ./pannels/dock.nix)
    (import ./pannels/app-menu.nix)
  ];
}
