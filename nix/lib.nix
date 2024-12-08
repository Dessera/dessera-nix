{
  plasma-manager,
  catppuccin,
  vscode-server,
  kwin-effects-forceblur,
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
      meta
      ;
  };
  defaultModuleUtils = moduleUtils { };
in
{
  default = defaultModuleUtils;
  generator = moduleUtils;
}
