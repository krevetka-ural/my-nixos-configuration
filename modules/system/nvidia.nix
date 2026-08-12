{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # for steam
  };

# Xserver default drivers
  services.xserver.videoDrivers = [ "nvidia" ];

# Nvidia Driver configuration
  hardware.nvidia = {
  # Enable GUI utils
    modesetting.enable = true;
    nvidiaSettings = true;

  # Power manager for laptops
    powerManagement.enable = false; # Change "true", if you have laptop
    powerManagement.finegrained = false; # This too...

  # Open drivers ONLY for 16xx or RTX series of NOvidea cards
    open = true; # if 10xx or older "= false";

  # Driver branch
    package = config.boot.kernelPackages.nvidiaPackages.unstable; # or ".beta", ".stable"
  };
}
