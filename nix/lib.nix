{
  plasma-manager,
  catppuccin,
  nur,
  ...
}:

let
  meta = import ../meta;
  moduleUtils = import ../lib {
    inherit
      plasma-manager
      catppuccin
      nur
      meta
      ;
  };
  defaultModuleUtils = moduleUtils { };
in
{
  default = defaultModuleUtils;
  generator = moduleUtils;
}
