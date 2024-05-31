{ ... }:

{
  security.doas = {
    enable = true;
    extraRules = [
      {
        users = [ "dessera" ];
        keepEnv = true;
        persist = true;
      }
    ];
  };

  # Disable sudo
  security.sudo.enable = false;
}
