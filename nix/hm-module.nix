lib:
let
  modulePath = ../modules/hm;
in
{
  default = lib.default.importModule modulePath;
  generator = customModuleUtils: customModuleUtils.importModule modulePath;
}
