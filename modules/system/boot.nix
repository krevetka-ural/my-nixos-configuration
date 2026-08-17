{ config, pkgs, ... }:
{
# Custom timeout
  boot.loader.timeout = 25;

# Linux Kernel
  boot.kernelPackages = pkgs.linuxPackages; # "_latest", for arch-expirience, or "_zen", for gaming.

# SystemD boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 20; # if your monitor has FullHD "10"

# GRUB for dualboot
#  boot.loader.grub.enable = true;
#  boot.loader.grub.device = "nodev"; # for old BIOS "/dev/sdX"
#  boot.loader.grub.efiSupport = true;
#  boot.loader.grub.useOSProber = true; # Find Windows or other Linux
}
