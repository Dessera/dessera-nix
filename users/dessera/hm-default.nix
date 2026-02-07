{
  imports = [
    ./programs.nix
  ];

  dnix = {
    style.enable = true;
  };

  home.stateVersion = "24.05";
}
