{ importModules, ... }:
{ catppuccin, nur, ... }:
{ ... }:

{
  imports =
    [
      catppuccin.homeManagerModules.catppuccin
      nur.hmModules.nur
    ]
    ++ (importModules [
      ../common/catppuccin.nix

      ./desktop
      ./packages
    ]);

  catppuccin.pointerCursor.enable = true;
  home.pointerCursor.size = 25;
}
