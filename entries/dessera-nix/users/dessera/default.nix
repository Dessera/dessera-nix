{ ... }:

{
  imports = [
    ./packages.nix
    ../../../../common/x86_64-linux/desktops/fonts/user.nix
    ../../../../common/x86_64-linux/desktops/cursor/user.nix
    ../../../../common/x86_64-linux/desktops/gnome/user.nix
    ../../../../common/x86_64-linux/desktops/gtk/user.nix

    ../../../../common/x86_64-linux/services/fcitx5/user.nix
  ];

  home = {
    username = "dessera";
    homeDirectory = "/home/dessera";
    stateVersion = "24.05";
  };
}
