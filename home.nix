{ config, pkgs, username, ... }: {
# Enable Home Manager
  programs.home-manager.enable = true;

# Home username & directory
  home.username = username;
  home.homeDirectory = "/home/${username}";

# Imports home configs
  imports = [
    ./modules/home/alacritty.nix
    ./modules/home/btop.nix
    ./modules/home/fish.nix
    ./modules/home/fastfetch.nix
    ./modules/home/starship.nix
  ];

# Home packages
  home.packages = with pkgs; [
  ];

# Stste Version Home Manager
  home.stateVersion = "26.05";
}
