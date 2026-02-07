{
  dnix.services = {
    xserver.enable = true;
  };

  services = {
    v2raya.enable = true;
  };

  services.dbus.implementation = "broker";
}
