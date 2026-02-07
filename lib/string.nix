{ lib, ... }:

{
  toUpperInitial =
    str:
    let
      first = lib.substring 0 1 str;
      rest = lib.substring 1 (lib.stringLength str) str;
    in
    lib.concatStrings [
      (lib.toUpper first)
      rest
    ];
}
