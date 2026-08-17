{ config, pkgs, hostname, ... }:
{
# Hostname. Remember, [nixos rebuild-switch --flake .#your_hostname]
  networking.hostName = hostname;

# Locale (Russian)
  i18n.defaultLocale = "ru_RU.UTF-8";

# Time zone (your location)
  time.timeZone = "Asia/Yekaterinburg";  # or "Europe/Moscow";

# Allow unfree software
  nixpkgs.config.allowUnfree = true;

# Network Manager
  networking.networkmanager.enable = true;

# Power management in KDE Plasma
  services.power-profiles-daemon.enable = true;

# Lix for Sesbian Lex >:)
  nix.package = pkgs.lixPackageSets.stable.lix;

# Enable Flakes and experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Auto clear old generatons (after 3 days)
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}