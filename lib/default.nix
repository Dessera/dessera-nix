{ inputs, lib }@args:

rec {
  # Profile Utils
  profile = import ./profile.nix args;

  mkProfile = profile.mkProfile;
  mkUser = profile.mkUser;
}
