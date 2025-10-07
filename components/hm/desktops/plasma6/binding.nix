{
  programs.plasma = {
    input.keyboard.numlockOnStartup = "on";

    hotkeys = {
      commands = {
        terminal = {
          command = "wezterm";
          comment = "Run terminal";
          key = "Ctrl+Alt+T";
        };
        launcher = {
          command = "fuzzel";
          comment = "Run fuzzel app launcher";
          key = "Alt+Space";
        };
      };
    };
  };
}
