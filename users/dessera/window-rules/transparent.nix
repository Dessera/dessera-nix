cfg:
let
  buildWindowRegex =
    {
      exclude ? [ ],
    }:
    let
      excludeRegex =
        if exclude == [ ] then "" else "^(?!.*(${toString (builtins.concatStringsSep "|" exclude)})).*";
    in
    excludeRegex;
in
{
  description = "Force transparent on all windows";
  apply = {
    opacityactive.value = cfg.activeOpacity;
    opacityactiverule.value = 2;
    opacityinactive.value = cfg.inactiveOpacity;
    opacityinactiverule.value = 2;
  };
  match = {
    window-types = [ "normal" ];

    window-class = {
      type = "regex";
      value = buildWindowRegex {
        exclude = cfg.exclude;
      };
    };
  };
}
