{ ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # GNOME use PulseAudio by default, must be disabled manually
  hardware.pulseaudio.enable = false;
}
