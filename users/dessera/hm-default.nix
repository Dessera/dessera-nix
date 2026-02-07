{
  imports = [
    ./desktops.nix
    ./programs.nix
  ];

  dnix.system = {
    style.enable = true;
  };

  home.stateVersion = "24.05";
}
