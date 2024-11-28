{
  location = "bottom";
  alignment = "center";
  lengthMode = "fit";
  hiding = "dodgewindows";
  floating = true;
  height = 58;
  screen = 0;
  widgets = [
    {
      iconTasks = {
        launchers = [
          "applications:org.kde.dolphin.desktop"
          "applications:org.kde.konsole.desktop"
          "applications:firefox.desktop"
          "applications:code.desktop"
          "applications:systemsettings.desktop"
        ];
      };
    }
    "org.kde.plasma.marginsseparator"
    {
      kickerdash = {
        icon = "nix-snowflake-white";
      };
    }
  ];
}
