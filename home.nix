{ config, pkgs, username, ... }:
{
# Home username
  home.username = username;

# Home Directory
  home.homeDirectory = "/home/${username}";

# Stste Version Home Manager
  home.stateVersion = "26.05";

# Home packages
  home.packages = with pkgs; [
    vscodium
    kdePackages.kdeconnect-kde
#    fastfetch
#    fish
  ];

# Imports home configs
  imports = [
    ./modules/home/alacritty.nix
    ./modules/home/fish.nix
    ./modules/home/starship.nix
    ./modules/home/fastfetch.nix
  ];

# Enable Home Manager
  programs.home-manager.enable = true;
}
