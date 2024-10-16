pkgs: rec {
  cursor = import ./cursor.nix pkgs;
  icon = import ./icon.nix pkgs;
  theme = import ./theme.nix pkgs;

  packages = [
    cursor.package
    icon.package
    theme.gtk.package
    theme.plasma.package
  ];
}
