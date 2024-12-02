lib:
let
  modulePath = ../modules/nixos;
in
{
  default = lib.default.importModule modulePath;
  generator = customModuleUtils: customModuleUtils.importModule modulePath;
}
