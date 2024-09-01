{
  emacsWithPackagesFromUsePackage,
  emacsGit
}:
emacsWithPackagesFromUsePackage {
  package = emacsGit;
  config = ./config.el;

  extraEmacsPackages = epkgs: [];
}