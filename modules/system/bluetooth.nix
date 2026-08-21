{ config, pkgs, ... }: {
# Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

#  services.blueman.enable = true; # If you not using KDE PLasma
}
