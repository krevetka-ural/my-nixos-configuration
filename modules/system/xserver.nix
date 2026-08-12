{ config, pkgs, ... }:
{
# Keyboard xrog config
  services.xserver.xkb = {
    layout = "us,ru"; # Engilsh and Russian
    options = "grp:caps_toggle"; # Change keyboard layout via 'CAPS LOCK'
  };

# Use Xkeyboard config in TTY or console
  console.useXkbConfig = true;

# Enable xorg
  services.xserver.enable = true;
}
