{ config, pkgs, ... }:
{
# Greeter (Plasma Login)
  services.displayManager.plasma-login-manager.enable = true;

# KDE PLasma 6
  services.desktopManager.plasma6.enable = true;
}