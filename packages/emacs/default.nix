{ emacsWithPackagesFromUsePackage
, emacs-git
}:
emacsWithPackagesFromUsePackage {
  package = emacs-git;
  config = ./config.el;
  defaultInitFile = true;

  extraEmacsPackages = epkgs: [
    epkgs.use-package
    epkgs.doom-themes
    epkgs.all-the-icons
  ];
}
