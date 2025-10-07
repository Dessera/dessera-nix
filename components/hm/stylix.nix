{ pkgs, ... }:

{
  stylix = {
    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    targets = {
      firefox.profileNames = [ "default" ];
      vscode.profileNames = [
        "Cpp"
        "Csharp"
        "Python"
        "Rust"
        "Web"
        "Zig"
        "Nix"
        "default"
      ];
      qt.enable = false;
    };
  };
}
