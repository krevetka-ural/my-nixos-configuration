{ config, pkgs, lib, inputs, ... }:
{
# Import system configs
  imports =
    [
      ./hardware-configuration.nix
      ./modules/system/boot.nix # Boot options (systemd-boot, grub, EFI support, etc.)
      ./modules/system/system.nix # System management (network, locale, time, etc.)
      ./modules/system/programs.nix # Programs and applcations
      ./modules/system/terminal.nix # Terminal preferences
      ./modules/system/nvidia.nix # NOvidea cards
      ./modules/system/audio.nix # Audio confs
      ./modules/system/user.nix # User settings and user groups
      ./modules/system/xserver.nix # Xorg and Xkeyboard
      ./modules/system/plasma.nix # KDE Plasma applications
      ./modules/system/desktop.nix # Desktop and greeter
      ./modules/system/virtmgr.nix # Virtual machines manager
      ./modules/system/games.nix # Steam preferences
    ];

# Stste version ("26.05" Yarara or "26.11" Zokor)
  system.stateVersion = "26.05";
}
