importModule:
{ ... }:
{ ... }:

{
  imports = [
    # ./wpsoffice-cn/hm.nix
    (importModule ./wpsoffice-cn/hm.nix)
    (importModule ./git/hm.nix)
    (importModule ./fish/hm.nix)
    (importModule ./zsh/hm.nix)
    (importModule ./firefox/hm.nix)
    # ./zsh/hm.nix
    # ./firefox/hm.nix
  ];
}
