{ config, pkgs, lib, inputs, helium, ... }: {
# Import system configs
  imports =
    [
      ./hardware-configuration.nix
      ./modules/system/boot.nix # Boot options (systemd-boot, grub, EFI support, etc.)
      ./modules/system/system.nix # System management (network, locale, time, etc.)
      ./modules/system/bluetooth.nix # Bluetooth enabling
      ./modules/system/audio.nix # Audio confs
      ./modules/system/user.nix # User settings and user groups
      ./modules/system/plasma.nix # KDE Plasma applications
      ./modules/system/desktop.nix # Desktop and greeter
      ./modules/system/steam.nix # Steam preferences
    ];

# Locale (Russian)
  i18n.defaultLocale = "ru_RU.UTF-8"; # or "us_US.UTF-8"
  time.timeZone = "Asia/Yekaterinburg"; # or "Europe/Moscow";

# Enable Flakes and experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Lix for Sesbian Lex >:)
  nix.package = pkgs.lixPackageSets.stable.lix;

# Allow unfree software
  nixpkgs.config.allowUnfree = true;

# Virtual machines enabling
  virtualisation.libvirtd.enable = true; # virtual input enable
  programs.virt-manager.enable = true;

# System packages
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    krita
    haruna
    vesktop
    obsidian
    obs-studio
    qbittorrent
    prismlauncher
    terminus_font
    wireguard-tools
    telegram-desktop
    helium.packages.x86_64-linux.default
  ];

# State version ("26.05" Yarara or "26.11" Zokor)
  system.stateVersion = "26.05";
}

