{ plasma-manager, catppuccin, ... }:

let
  meta = import ../meta;
  moduleUtils = import ../lib { inherit plasma-manager catppuccin meta; };
  defaultModuleUtils = moduleUtils { };
in
{
  default = defaultModuleUtils;
  generator = moduleUtils;
}
