{
  dnix.hardware = {
    bluetooth.enable = true;
  };

  hardware = {
    facter.reportPath = ./facter.json;

    nvidia = {
      prime = {
        offload = {
          enable = false;
          enableOffloadCmd = false;
        };

        reverseSync.enable = true;
        allowExternalGpu = true;
      };
    };
  };
}
