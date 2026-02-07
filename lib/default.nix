{ inputs, lib }@args:

rec {
  # Profile Utils
  profile = import ./profile.nix args;

  # String Utils
  string = import ./string.nix args;

  mkProfile = profile.mkProfile;
  mkUser = profile.mkUser;

  toUpperInitial = string.toUpperInitial;
}
