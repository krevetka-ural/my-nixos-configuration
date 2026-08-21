{ config, pkgs, helium, ... }: {
# Power management in KDE Plasma
  services.power-profiles-daemon.enable = true;

# KDE Connect for phone
  programs.kdeconnect.enable = true;

# Install some KDE programs
  environment.systemPackages = with pkgs.kdePackages; [
    partitionmanager
    spectacle
    kdenlive
    gwenview
    falkon
    kcalc
    kate
    ark
  ];

# Remove some KDE "bloat"
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    qrca
    discover
    print-manager
    plasma-browser-integration
  ];
}
