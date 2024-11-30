{ plasma-manager, ... }:

let
  meta = import ../meta;
  moduleUtils = import ../lib { inherit plasma-manager meta; };
  defaultModuleUtils = moduleUtils { };
in {
  default = defaultModuleUtils;
  generator = moduleUtils;
}