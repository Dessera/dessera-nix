importModule:
{ ... }:
{ ... }:

{
  imports = [
    (importModule ./desktop/hm.nix)
    (importModule ./services/hm.nix)
    (importModule ./packages/hm.nix)
  ];
}
