{ ... }:

{
  imports = [
    ./packages/hm.nix
    ./services/hm.nix
    ./desktop/hm.nix
  ];

  _module.args = {
    meta = import ./meta;
  };
}
