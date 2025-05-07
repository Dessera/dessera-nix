_:

{

  networking.hostName = "dessera-asus";

  modules.services = {
    cygnus-rs = {
      enable = true;
      userFile = "/etc/cygnus.usr";
    };
  };
}
