{
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    extensions = [
      "nix"
      "meson"
      "markdownlint"
      "git-firefly"
      "toml"
    ];
    userSettings = {
      disable_ai = true;
      buffer_font_fallbacks = [ "Source Han Sans SC" ];
      cursor_shape = "block";
      minimap = {
        show = "always";
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = false;
        show_parameter_hints = false;
      };
      indent_guides = {
        coloring = "indent_aware";
        background_coloring = "indent_aware";
      };
      wrap_guides = [ 80 ];
      format_on_save = "on";
      show_whitespaces = "boundary";
      middle_click_paste = false;
      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
            "..."
          ];
        };
        Python = {
          language_servers = [
            "pylsp"
            "!basedpyright"
            "..."
          ];
        };
      };
      lsp = {
        pylsp = {
          settings = {
            plugins = {
              mypy.enabled = true;
              rope_autoimport = {
                enabled = true;
                comletions.enabled = true;
                code_actions.enabled = true;
              };
              rope_completion = {
                enabled = true;
                eager = true;
              };
              pyflakes.enabled = false;
              pycodestyle.enabled = false;
            };
          };
        };
      };
    };
  };
}
