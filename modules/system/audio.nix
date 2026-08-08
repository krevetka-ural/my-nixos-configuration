{ config, pkgs, ... }:
{
# Rtkit
  security.rtkit.enable = true;

# Pulseaudio disable
  services.pulseaudio.enable = false;

# Audio (Pipewire)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}