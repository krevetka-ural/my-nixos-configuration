{ config, pkgs, ... }: {
# Greeter (Plasma Login)
  services.displayManager.plasma-login-manager.enable = true;

# Greeter (SDDM)
#  services.displayManager.sddm.enable = true; # If you use SDDM
#  services.displayManager.sddm.wayland.enable = true; # Enable Wayland in SDDM

# KDE Plasma 6
  services.desktopManager.plasma6.enable = true;
}
