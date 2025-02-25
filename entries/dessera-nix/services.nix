_:

{

  networking.hostName = "dessera-nix";

  modules.services = {
    cygnus-rs = {
      enable = true;
      userFile = "/etc/cygnus.usr";
    };
  };
}
