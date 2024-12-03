{
  plasma-manager,
  catppuccin,
  nur,
  kwin-effects-forceblur,
  ...
}:

let
  meta = import ../meta;
  moduleUtils = import ../lib {
    inherit
      plasma-manager
      catppuccin
      nur
      kwin-effects-forceblur
      meta
      ;
  };
  defaultModuleUtils = moduleUtils { };
in
{
  default = defaultModuleUtils;
  generator = moduleUtils;
}
