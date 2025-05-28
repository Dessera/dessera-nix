{
  networking = {
    hostName = "dessera-asus";

    interfaces = {
    };
  };

  modules.services = {
    cygnus-rs = {
      enable = true;
      userFile = "/etc/cygnus.usr";
    };
  };
}
