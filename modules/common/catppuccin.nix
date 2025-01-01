{ meta, ... }:
_: {
  catppuccin = {
    inherit (meta.appearance) flavor accent;
  };
}
