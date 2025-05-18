let
  conf = import ../config.nix;
in
{
  catppuccin = {
    inherit (conf) accent flavor;
  };
}
