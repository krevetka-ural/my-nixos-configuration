{ config, pkgs, hostname, ... }: {
# Hostname for network
  networking.hostName = hostname;

# Network Manager
  networking.networkmanager.enable = true;

# Enable xorg
  services.xserver.enable = true;

# Keyboard xorg config
  services.xserver.xkb = {
    layout = "us,ru"; # Engilsh and Russian
    options = "grp:caps_toggle"; # Change keyboard layout via 'CAPS LOCK'
  };

# Use Xkeyboard config in TTY
  console.useXkbConfig = true;

# Set font in TTY by 20 pixel size
  console.font = "ter-v20n";

# Auto clear old generatons after 7 days
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}
