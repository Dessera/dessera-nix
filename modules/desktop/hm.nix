importModule:
{ ... }:
{ ... }:

{
  imports = [
    (importModule ./plasma/hm.nix)
    (importModule ./gtk/hm.nix)
    (importModule ./qt/hm.nix)
    # ./gtk/hm.nix
    # ./qt/hm.nix
  ];
}
