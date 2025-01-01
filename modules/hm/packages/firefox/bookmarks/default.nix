[
  {
    name = "书签栏";
    toolbar = true;
    bookmarks = [
      (import ./nixos.nix)
      (import ./school.nix)
      (import ./cs.nix)
      (import ./network.nix)
    ];
  }
]
