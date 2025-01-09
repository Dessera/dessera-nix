{ meta, ... }:
{
  catppuccin = {
    inherit (meta.appearance) flavor accent;
  };
}
