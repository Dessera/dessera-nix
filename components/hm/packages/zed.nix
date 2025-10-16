{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "meson"
    ];
    userSettings = {
      disable_ai = true;
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
    };
  };
}
