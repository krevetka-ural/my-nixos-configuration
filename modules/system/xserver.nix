{ config, pkgs, ... }:
{
# Keyboard xrog config
  services.xserver.xkb = {
    layout = "us,ru"; # Engilsh and Russian
    options = "grp:caps_toggle"; # Change keyboard layout via 'CAPS LOCK'
  };

# Enable xorg
  services.xserver.enable = true;
}
