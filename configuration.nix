{ config, pkgs, lib, inputs, ... }:
{
# Import system configs
  imports =
    [
      ./hardware-configuration.nix
      ./modules/system/boot.nix # Boot options (systemd-boot, grub, EFI support, etc.)
      ./modules/system/system.nix # System management (network, locale, time, etc.)
      ./modules/system/terminal.nix # Terminal preferences
      ./modules/system/nvidia.nix # NOvidea cards
      ./modules/system/audio.nix # Audio confs
      ./modules/system/user.nix # User settings adn groups
      ./modules/system/xserver.nix # Xorg and Xkeyboard
      ./modules/system/desktop.nix # Desktop and greeter
    #  ./modules/system/vpn.nix # Wireguard proxy
      ./modules/system/games.nix # Steam preferences
    ];

# Stste version ("26.05" Yarara or "26.11" Zokor)
  system.stateVersion = "26.05";

# Fish shell             <*>< <*>< <*>< 
  programs.fish.enable = true;

# Virtual machines
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

# System packages
  environment.systemPackages = with pkgs; [
  # Git utils
    wget
    git
    curl
  # Termianal utils and fonts
    btop
    terminus_font
  # Social
    vesktop
    telegram-desktop
  # Media
    haruna
    vlc
    obs-studio
    krita
    libreoffice-qt
  # Network
    wireguard-tools
    chromium
    qbittorrent
  # Games
    prismlauncher
  # KDE packages
    kdePackages.partitionmanager
    kdePackages.kdenlive
    kdePackages.kcalc
    kdePackages.kate
    kdePackages.gwenview
    kdePackages.spectacle
    kdePackages.ark
  ];
}
