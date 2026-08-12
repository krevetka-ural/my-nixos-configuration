{ config, pkgs, ... }:
{
# Greeter (Plasma Login)
  services.displayManager.plasma-login-manager.enable = true;
#  services.displayManager.sddm.enable = true; # If you use SDDM

# KDE PLasma 6
  services.desktopManager.plasma6.enable = true;
}
