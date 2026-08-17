{ config, pkgs, ... }:
{
  # System packages
  environment.systemPackages = with pkgs; [
  # Git utils
    wget
    git
    curl
  # Termianal utils and fonts
    btop
    terminus_font
  # Media
    haruna
    obs-studio
    krita
  # Network
    chromium
    qbittorrent
  # Games
    prismlauncher
  ];
}