{
  plasma-manager,
  catppuccin,
  vscode-server,
  kwin-effects-forceblur,

  nur,
  ...
}:

let
  meta = import ../meta;
  moduleUtils = import ../lib {
    inherit
      plasma-manager
      catppuccin
      vscode-server
      kwin-effects-forceblur
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
