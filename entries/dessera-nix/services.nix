{ lib, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # GNOME use PulseAudio by default, must be disabled manually
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm = {
      enable = true;
    };
  };

  networking = {
    hostName = "dessera-nix";
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    hosts = {
      "199.232.96.133" = [ "raw.githubusercontent.com" ];
    };
  };

  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "dessera" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
    sudo.enable = false;
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;

      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
      
      extraPackages = with pkgs; [
        podman-compose
        dive
        shadow
      ];
    };
  };

  # environment.systemPackages = with pkgs; [
  #   podman-tui
  #   podman-compose
  #   dive
  #   shadow
  # ];

  services.openssh = {
    enable = true;
    ports = [ 39901 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
      X11Forwarding = true;
    };
  };
}
