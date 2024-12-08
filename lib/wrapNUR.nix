{ nur, pkgs }:
(import nur {
  nurpkgs = pkgs;
  inherit pkgs;
})
