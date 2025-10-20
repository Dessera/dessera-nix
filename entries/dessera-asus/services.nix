{
  imports = [
    ../../components/nixos/services/xserver.nix
  ];

  services.dbus.implementation = "broker";
}
