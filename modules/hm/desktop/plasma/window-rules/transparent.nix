let
  buildWindowRegex =
    {
      exclude ? [ ],
    }:
    let
      excludeRegex = "^(?!.*(${toString (builtins.concatStringsSep "|" exclude)})).*";
    in
    excludeRegex;
in
{
  description = "Force transparent on all windows";
  apply = {
    opacityactive.value = 85;
    opacityactiverule.value = 2;
    opacityinactive.value = 85;
    opacityinactiverule.value = 2;
  };
  match = {
    window-types = [ "normal" ];

    window-class = {
      type = "regex";
      value = buildWindowRegex {
        exclude = [
          "firefox"
        ];
      };
    };
  };
}
