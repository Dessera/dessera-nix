{ generalTheme, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = generalTheme.cursor;
    theme = generalTheme.theme.gtk;
    iconTheme = generalTheme.icon;
  };
}
